import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/recipe.dart';
import 'app_localizations.dart';
import 'recipe_repository.dart';

/// Ilovaning global holati: saqlangan retseptlar, til, tema va foydalanuvchi.
/// Foydalanuvchi va auth holati endi Supabase orqali boshqariladi.
class AppState extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  Set<String> _savedRecipeIds = {};

  String languageCode = 'uz';
=======
import '../models/recipe.dart';
import 'app_localizations.dart';
import 'mock_data.dart';

/// Demo hisob ma'lumotlari — MVP uchun yagona "haqiqiy" hisob.
/// Haqiqiy backend ulanganda bu klass API chaqiruviga almashtiriladi.
class DemoAccount {
  static const email = 'demo@oshxona.uz';
  static const password = 'demo123';
}

/// Ilovaning global holati: saqlangan retseptlar, til, tema va foydalanuvchi.
class AppState extends ChangeNotifier {
  final Set<String> _savedRecipeIds = {'palov', 'shawarma', 'salat'};

  String userName = 'Jahongir M.';
  String userEmail = DemoAccount.email;

  /// 'uz' yoki 'ru'
  String languageCode = 'uz';

>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  bool darkMode = false;
  bool notificationsEnabled = true;

  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;

<<<<<<< HEAD
  User? get currentUser => _supabase.auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  String get userName => currentUser?.userMetadata?['full_name'] as String? ?? 'Foydalanuvchi';
  String get userEmail => currentUser?.email ?? '';

  List<Recipe> get savedRecipes =>
      RecipeRepository.instance.allRecipes.where((r) => _savedRecipeIds.contains(r.id)).toList();

  bool isSaved(String recipeId) => _savedRecipeIds.contains(recipeId);

  Future<void> loadFavorites() async {
    final userId = currentUser?.id;
    if (userId == null) {
      _savedRecipeIds = {};
      notifyListeners();
      return;
    }
    final rows = await _supabase.from('favorites').select('recipe_id').eq('user_id', userId);
    _savedRecipeIds = rows.map<String>((r) => r['recipe_id'] as String).toSet();
    notifyListeners();
  }

  Future<void> toggleSaved(String recipeId) async {
    final userId = currentUser?.id;
    if (userId == null) return;

    if (_savedRecipeIds.contains(recipeId)) {
      _savedRecipeIds.remove(recipeId);
      notifyListeners();
      await _supabase.from('favorites').delete().eq('user_id', userId).eq('recipe_id', recipeId);
    } else {
      _savedRecipeIds.add(recipeId);
      notifyListeners();
      await _supabase.from('favorites').insert({'user_id': userId, 'recipe_id': recipeId});
    }
  }

=======
  List<Recipe> get savedRecipes =>
      MockData.allRecipes.where((r) => _savedRecipeIds.contains(r.id)).toList();

  bool isSaved(String recipeId) => _savedRecipeIds.contains(recipeId);

  void toggleSaved(String recipeId) {
    if (_savedRecipeIds.contains(recipeId)) {
      _savedRecipeIds.remove(recipeId);
    } else {
      _savedRecipeIds.add(recipeId);
    }
    notifyListeners();
  }

  /// Joriy tilga mos matnni qaytaradi. Masalan: `appState.t('login_title')`
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  String t(String key) => AppLocalizations.t(languageCode, key);

  void setLanguage(String code) {
    if (languageCode == code) return;
    languageCode = code;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    darkMode = value;
    notifyListeners();
  }

  void setNotifications(bool value) {
    notificationsEnabled = value;
    notifyListeners();
  }

<<<<<<< HEAD
  /// Kirish. Muvaffaqiyatli bo'lsa null, aks holda xato matnini qaytaradi.
  Future<String?> login(String email, String password) async {
    try {
      await _supabase.auth.signInWithPassword(email: email.trim(), password: password);
      await loadFavorites();
      return null;
    } on AuthException catch (e) {
      return e.message;
    }
  }

  /// Ro'yxatdan o'tish. Muvaffaqiyatli bo'lsa null, aks holda xato matnini qaytaradi.
  Future<String?> register(String name, String email, String password) async {
    try {
      await _supabase.auth.signUp(
        email: email.trim(),
        password: password,
        data: {'full_name': name.trim()},
      );
      return null;
    } on AuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
    _savedRecipeIds = {};
    notifyListeners();
  }
}
=======
  /// Demo hisob bilan taqqoslab kirish. Muvaffaqiyatli bo'lsa true qaytaradi.
  bool login(String email, String password) {
    final ok = email.trim().toLowerCase() == DemoAccount.email && password == DemoAccount.password;
    if (ok) {
      userEmail = DemoAccount.email;
    }
    return ok;
  }
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
