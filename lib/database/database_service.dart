import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/models.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('saymeal.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        timestamp TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE food_items (
        id TEXT PRIMARY KEY,
        mealId TEXT NOT NULL,
        name TEXT NOT NULL,
        quantity TEXT NOT NULL,
        calories REAL NOT NULL,
        protein REAL NOT NULL,
        carbs REAL NOT NULL,
        fat REAL NOT NULL,
        imageUrl TEXT,
        FOREIGN KEY (mealId) REFERENCES meals (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> insertMeal(Meal meal) async {
    final db = await instance.database;
    await db.insert('meals', meal.toMap());
    for (var item in meal.items) {
      await db.insert('food_items', {
        ...item.toMap(),
        'mealId': meal.id,
      });
    }
  }

  Future<List<Meal>> getDailyMeals(DateTime date) async {
    final db = await instance.database;
    final startOfDay = DateTime(date.year, date.month, date.day).toIso8601String();
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59).toIso8601String();

    final result = await db.query(
      'meals',
      where: 'timestamp BETWEEN ? AND ?',
      whereArgs: [startOfDay, endOfDay],
      orderBy: 'timestamp DESC',
    );

    List<Meal> meals = [];
    for (var row in result) {
      final itemsResult = await db.query(
        'food_items',
        where: 'mealId = ?',
        whereArgs: [row['id']],
      );

      final items = itemsResult.map((i) => FoodItem.fromMap(i)).toList();
      meals.add(Meal(
        id: row['id'] as String,
        type: MealType.values.byName(row['type'] as String),
        timestamp: DateTime.parse(row['timestamp'] as String),
        items: items,
      ));
    }
    return meals;
  }
}
