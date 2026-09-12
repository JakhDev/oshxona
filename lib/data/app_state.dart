import 'package:flutter/material.dart';
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

  bool darkMode = false;
  bool notificationsEnabled = true;

  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;

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

  /// Demo hisob bilan taqqoslab kirish. Muvaffaqiyatli bo'lsa true qaytaradi.
  bool login(String email, String password) {
    final ok = email.trim().toLowerCase() == DemoAccount.email && password == DemoAccount.password;
    if (ok) {
      userEmail = DemoAccount.email;
    }
    return ok;
  }
}
