import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/recipe.dart';

/// Retseptlar va kategoriyalarni Supabase'dan bir marta yuklab,
/// xotirada saqlaydigan repository. `MockData` bilan bir xil
/// metod nomlariga ega — shuning uchun ekranlarda faqat
/// `MockData.` o'rniga `RecipeRepository.instance.` yoziladi.
class RecipeRepository {
  RecipeRepository._();
  static final RecipeRepository instance = RecipeRepository._();

  final _supabase = Supabase.instance.client;

  List<Recipe> allRecipes = [];
  List<RecipeCategory> categories = [];
  bool _loaded = false;

  /// Supabase'dan bir martalik yuklash. `splash_screen.dart`da chaqiriladi.
  Future<void> load() async {
    if (_loaded) return;
    final catsData = await _supabase.from('categories').select();
    final recipesData = await _supabase.from('recipes').select();
    categories = catsData.map<RecipeCategory>(RecipeCategory.fromJson).toList();
    allRecipes = recipesData.map<Recipe>(Recipe.fromJson).toList();
    _loaded = true;
  }

  List<Recipe> get popularRecipes {
    final sorted = List<Recipe>.from(allRecipes)..sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(6).toList();
  }

  List<Recipe> byCategory(String categoryId) {
    if (categoryId == 'diabet') {
      return allRecipes.where((r) => r.isDiabetic).toList();
    }
    return allRecipes.where((r) => r.categoryId == categoryId).toList();
  }

  List<Recipe> search(String query, String lang) {
    if (query.trim().isEmpty) return [];
    final q = query.toLowerCase();
    return allRecipes.where((r) => r.titleFor(lang).toLowerCase().contains(q)).toList();
  }
}