import 'package:intl/intl.dart';

enum MealType { breakfast, lunch, dinner, snacks }

class MacroData {
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  const MacroData({
    this.calories = 0,
    this.protein = 0,
    this.carbs = 0,
    this.fat = 0,
  });

  MacroData operator +(MacroData other) {
    return MacroData(
      calories: calories + other.calories,
      protein: protein + other.protein,
      carbs: carbs + other.carbs,
      fat: fat + other.fat,
    );
  }

  factory MacroData.fromJson(Map<String, dynamic> json) {
    return MacroData(
      calories: _toDouble(json['calories']),
      protein: _toDouble(json['protein']),
      carbs: _toDouble(json['carbs']),
      fat: _toDouble(json['fat']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) {
      final clean = value.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.tryParse(clean) ?? 0;
    }
    return 0;
  }
}

class FoodItem {
  final String id;
  final String name;
  final String quantity;
  final MacroData macros;
  final String? imageUrl;

  const FoodItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.macros,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'calories': macros.calories,
      'protein': macros.protein,
      'carbs': macros.carbs,
      'fat': macros.fat,
      'imageUrl': imageUrl,
    };
  }

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      macros: MacroData(
        calories: map['calories'],
        protein: map['protein'],
        carbs: map['carbs'],
        fat: map['fat'],
      ),
      imageUrl: map['imageUrl'],
    );
  }
}

class Meal {
  final String id;
  final MealType type;
  final DateTime timestamp;
  final List<FoodItem> items;

  const Meal({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.items,
  });

  MacroData get totalMacros {
    return items.fold(
      const MacroData(),
      (prev, element) => prev + element.macros,
    );
  }

  String get formattedTime => DateFormat.jm().format(timestamp);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
