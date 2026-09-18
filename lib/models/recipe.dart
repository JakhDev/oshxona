import 'package:flutter/material.dart';

/// Til kodiga qarab matn qaytaruvchi kichik yordamchi.
/// map = {'uz': '...', 'ru': '...'}
String localized(Map<String, String> map, String lang) {
  return map[lang] ?? map['uz'] ?? '';
}

List<String> localizedList(Map<String, List<String>> map, String lang) {
  return map[lang] ?? map['uz'] ?? const [];
}

/// Bitta tayyorlash bosqichi — sarlavha va tavsif ikkala tilda saqlanadi.
class CookingStep {
  final Map<String, String> title;
  final Map<String, String> description;

  const CookingStep({required this.title, required this.description});

  String titleFor(String lang) => localized(title, lang);
  String descriptionFor(String lang) => localized(description, lang);
<<<<<<< HEAD

  factory CookingStep.fromJson(Map<String, dynamic> json) => CookingStep(
    title: Map<String, String>.from(json['title'] as Map),
    description: Map<String, String>.from(json['description'] as Map),
  );

  Map<String, dynamic> toJson() => {'title': title, 'description': description};
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
}

/// Retsept modeli — barcha matn maydonlari uz/ru tillarida saqlanadi.
class Recipe {
  final String id;
  final Map<String, String> title;
<<<<<<< HEAD
  final String categoryId; // 'ozbek' | 'turk' | 'yevropa' | 'diabet' | 'salatlar'
=======
  final String categoryId; // 'ozbek' | 'turk' | 'yevropa' | 'diabet' (filtr uchun)
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  final String emoji;
  final Color bgColor;
  final int durationMin;
  final int calories;
  final int servings;
<<<<<<< HEAD
  final Map<String, String> difficulty;
=======
  final Map<String, String> difficulty; // Oson / O'rta / Qiyin
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  final double rating;
  final Map<String, List<String>> ingredients;
  final List<CookingStep> steps;
  final bool isDiabetic;
  final Map<String, String>? glycemicNote;

  const Recipe({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.emoji,
    required this.bgColor,
    required this.durationMin,
    required this.calories,
    required this.servings,
    required this.difficulty,
    required this.rating,
    required this.ingredients,
    required this.steps,
    this.isDiabetic = false,
    this.glycemicNote,
  });

  String titleFor(String lang) => localized(title, lang);
  String difficultyFor(String lang) => localized(difficulty, lang);
  List<String> ingredientsFor(String lang) => localizedList(ingredients, lang);
  String? glycemicNoteFor(String lang) => glycemicNote == null ? null : localized(glycemicNote!, lang);
<<<<<<< HEAD

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json['id'] as String,
    title: Map<String, String>.from(json['title'] as Map),
    categoryId: json['category_id'] as String,
    emoji: json['emoji'] as String? ?? '',
    bgColor: Color(json['bg_color'] as int),
    durationMin: json['duration_min'] as int,
    calories: json['calories'] as int,
    servings: json['servings'] as int,
    difficulty: Map<String, String>.from(json['difficulty'] as Map),
    rating: (json['rating'] as num).toDouble(),
    ingredients: (json['ingredients'] as Map).map(
          (k, v) => MapEntry(k as String, List<String>.from(v as List)),
    ),
    steps: (json['steps'] as List).map((s) => CookingStep.fromJson(s as Map<String, dynamic>)).toList(),
    isDiabetic: json['is_diabetic'] as bool? ?? false,
    glycemicNote: json['glycemic_note'] == null
        ? null
        : Map<String, String>.from(json['glycemic_note'] as Map),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category_id': categoryId,
    'emoji': emoji,
    'bg_color': bgColor.value,
    'duration_min': durationMin,
    'calories': calories,
    'servings': servings,
    'difficulty': difficulty,
    'rating': rating,
    'ingredients': ingredients,
    'steps': steps.map((s) => s.toJson()).toList(),
    'is_diabetic': isDiabetic,
    'glycemic_note': glycemicNote,
  };
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
}

class RecipeCategory {
  final String id;
  final Map<String, String> title;
  final String emoji;
  final Color color;
  final int recipeCount;

  const RecipeCategory({
    required this.id,
    required this.title,
    required this.emoji,
    required this.color,
    required this.recipeCount,
  });

  String titleFor(String lang) => localized(title, lang);
<<<<<<< HEAD

  factory RecipeCategory.fromJson(Map<String, dynamic> json) => RecipeCategory(
    id: json['id'] as String,
    title: Map<String, String>.from(json['title'] as Map),
    emoji: json['emoji'] as String? ?? '',
    color: Color(json['color'] as int),
    recipeCount: json['recipe_count'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'emoji': emoji,
    'color': color.value,
    'recipe_count': recipeCount,
  };
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
