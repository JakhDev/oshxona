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
}

/// Retsept modeli — barcha matn maydonlari uz/ru tillarida saqlanadi.
class Recipe {
  final String id;
  final Map<String, String> title;
  final String categoryId; // 'ozbek' | 'turk' | 'yevropa' | 'diabet' (filtr uchun)
  final String emoji;
  final Color bgColor;
  final int durationMin;
  final int calories;
  final int servings;
  final Map<String, String> difficulty; // Oson / O'rta / Qiyin
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
}
