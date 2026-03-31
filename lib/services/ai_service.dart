import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/models.dart';

class AIService {
  final String apiKey;
  late final GenerativeModel model;

  AIService({required this.apiKey}) {
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  Future<List<FoodItem>> parseTranscript(String transcript) async {
    final prompt = '''
      Extract food items from this transcript: "$transcript".
      For each food item, provide: 
      - name
      - quantity
      - estimated calories
      - estimated protein (g)
      - estimated carbs (g)
      - estimated fat (g)
      
      Return ONLY a JSON array of objects with these keys: 
      "name", "quantity", "calories", "protein", "carbs", "fat".
      
      Example:
      [
        {"name": "eggs", "quantity": "2", "calories": 140, "protein": 12, "carbs": 1, "fat": 10}
      ]
    ''';

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    
    final text = response.text;
    if (text == null) return [];

    try {
      final jsonStart = text.indexOf('[');
      final jsonEnd = text.lastIndexOf(']') + 1;
      final jsonString = text.substring(jsonStart, jsonEnd);
      final List<dynamic> data = jsonDecode(jsonString);
      
      return data.map((item) => FoodItem(
        id: DateTime.now().millisecondsSinceEpoch.toString() + item['name'],
        name: item['name'],
        quantity: item['quantity'],
        macros: MacroData(
          calories: (item['calories'] as num).toDouble(),
          protein: (item['protein'] as num).toDouble(),
          carbs: (item['carbs'] as num).toDouble(),
          fat: (item['fat'] as num).toDouble(),
        ),
      )).toList();
    } catch (e) {
      print('AI Error parsing JSON: $e');
      return [];
    }
  }
}
