/// Ilovaning barcha statik matnlari uchun markazlashgan tarjima lug'ati.
/// Yangi til qo'shish uchun shunchaki yangi kod ('en' kabi) va uning
/// key->matn xaritasini qo'shish kifoya.
class AppLocalizations {
  static const Map<String, Map<String, String>> _strings = {
    // ---- Umumiy / navigatsiya ----
    'nav_home': {'uz': 'Bosh', 'ru': 'Главная'},
    'nav_categories': {'uz': 'Kategoriya', 'ru': 'Категории'},
    'nav_saved': {'uz': 'Saqlangan', 'ru': 'Сохранено'},
    'nav_profile': {'uz': 'Profil', 'ru': 'Профиль'},

    // ---- Splash / Onboarding ----
    'app_name': {'uz': 'Oshxona', 'ru': 'Ошхона'},
    'app_tagline': {'uz': 'Mazali hayot boshlanadi shu yerdan', 'ru': 'Вкусная жизнь начинается здесь'},
    'onboard_welcome': {'uz': 'Xush kelibsiz!', 'ru': 'Добро пожаловать!'},
    'onboard_subtitle': {'uz': 'Eng mazali retseptlar sizni kutmoqda', 'ru': 'Самые вкусные рецепты уже ждут вас'},
    'onboard_item1_title': {'uz': '100+ retsept', 'ru': '100+ рецептов'},
    'onboard_item1_sub': {'uz': 'Har kuni yangilanib turadi', 'ru': 'Обновляется каждый день'},
    'onboard_item2_title': {'uz': 'Diabet menyu', 'ru': 'Меню для диабетиков'},
    'onboard_item2_sub': {'uz': "Sog'lom va mazali", 'ru': 'Полезно и вкусно'},
    'onboard_item3_title': {'uz': 'Bosqichma-bosqich', 'ru': 'Пошагово'},
    'onboard_item3_sub': {'uz': 'Oson va tushunarli', 'ru': 'Просто и понятно'},
    'btn_start': {'uz': 'Boshlash', 'ru': 'Начать'},

    // ---- Login / Register ----
    'login_title': {'uz': 'Kirish', 'ru': 'Вход'},
    'login_subtitle': {'uz': 'Hisobingizga kiring', 'ru': 'Войдите в свой аккаунт'},
    'email': {'uz': 'Email', 'ru': 'Email'},
    'password': {'uz': 'Parol', 'ru': 'Пароль'},
    'login_demo_hint': {'uz': 'Demo: demo@oshxona.uz / demo123', 'ru': 'Демо: demo@oshxona.uz / demo123'},
    'login_fill_demo': {'uz': 'Demo ma\'lumotni to\'ldirish', 'ru': 'Заполнить демо-данные'},
    'btn_login': {'uz': 'Kirish', 'ru': 'Войти'},
    'login_google': {'uz': 'Google orqali kirish', 'ru': 'Войти через Google'},
    'login_no_account': {'uz': "Hisob yo'qmi? ", 'ru': 'Нет аккаунта? '},
    'register_link': {'uz': "Ro'yxatdan o'tish", 'ru': 'Регистрация'},
    'login_error': {
      'uz': "Email yoki parol noto'g'ri.\nDemo: demo@oshxona.uz / demo123",
      'ru': 'Неверный email или пароль.\nДемо: demo@oshxona.uz / demo123'
    },
    'register_title': {'uz': "Ro'yxatdan o'tish", 'ru': 'Регистрация'},
    'name': {'uz': 'Ism', 'ru': 'Имя'},
    'name_hint': {'uz': 'Ismingiz', 'ru': 'Ваше имя'},
    'confirm_password': {'uz': 'Parolni tasdiqlang', 'ru': 'Подтвердите пароль'},
    'confirm_password_hint': {'uz': 'Qayta kiriting', 'ru': 'Введите ещё раз'},
    'password_create_hint': {'uz': 'Parol yarating', 'ru': 'Придумайте пароль'},
    'agree_terms': {'uz': 'Foydalanish shartlariga roziman', 'ru': 'Я согласен с условиями использования'},
    'btn_create_account': {'uz': 'Hisob yaratish', 'ru': 'Создать аккаунт'},
    'register_error_empty': {'uz': "Barcha maydonlarni to'ldiring", 'ru': 'Заполните все поля'},
    'register_error_agree': {'uz': "Shartlarga rozilik bering", 'ru': 'Примите условия использования'},
    'register_error_match': {'uz': "Parollar mos emas", 'ru': 'Пароли не совпадают'},
    'register_success': {
      'uz': "Hisob yaratildi! demo@oshxona.uz / demo123 orqali kiring",
      'ru': 'Аккаунт создан! Войдите через demo@oshxona.uz / demo123'
    },

    // ---- Home ----
    'greeting_morning': {'uz': 'Xayrli kun,', 'ru': 'Доброго дня,'},
    'search_hint': {'uz': 'Retsept qidiring...', 'ru': 'Искать рецепт...'},
    'filter_all': {'uz': 'Barchasi', 'ru': 'Все'},
    'popular_recipes': {'uz': 'Mashhur retseptlar', 'ru': 'Популярные рецепты'},

    // ---- Categories ----
    'categories_title': {'uz': 'Kategoriyalar', 'ru': 'Категории'},
    'recipe_count_suffix': {'uz': 'ta retsept', 'ru': 'рецептов'},
    'recipe_count_special_suffix': {'uz': 'ta maxsus retsept', 'ru': 'специальных рецептов'},

    // ---- Recipe detail ----
    'ingredients': {'uz': 'Ingredientlar', 'ru': 'Ингредиенты'},
    'servings_unit': {'uz': 'kishi', 'ru': 'порций'},
    'minutes_unit': {'uz': 'daqiqa', 'ru': 'минут'},
    'difficulty_unit': {'uz': 'daraja', 'ru': 'уровень'},
    'btn_start_cooking': {'uz': 'Tayyorlashni boshlash', 'ru': 'Начать готовить'},

    // ---- Cooking steps ----
    'cooking_suffix': {'uz': 'Tayyorlash', 'ru': 'Готовка'},
    'step_of': {'uz': 'bosqich', 'ru': 'шаг'},
    'btn_prev': {'uz': 'Oldingi', 'ru': 'Назад'},
    'btn_next': {'uz': 'Keyingi', 'ru': 'Далее'},
    'btn_finish': {'uz': 'Tugatish', 'ru': 'Завершить'},

    // ---- Diabetic menu ----
    'diabetic_title': {'uz': 'Diabet menyu', 'ru': 'Меню для диабетиков'},
    'diabetic_subtitle': {'uz': 'Past glisemik indeksli taomlar', 'ru': 'Блюда с низким гликемическим индексом'},

    // ---- Saved ----
    'saved_title': {'uz': 'Saqlangan', 'ru': 'Сохранённые'},
    'saved_empty': {'uz': "Hozircha saqlangan retsept yo'q", 'ru': 'Пока нет сохранённых рецептов'},

    // ---- Search ----
    'search_title': {'uz': 'Qidiruv', 'ru': 'Поиск'},
    'search_results_found': {'uz': 'ta natija topildi', 'ru': 'результатов найдено'},
    'search_no_results': {'uz': 'Natija topilmadi', 'ru': 'Результатов не найдено'},

    // ---- Profile ----
    'profile_recipes': {'uz': 'Retseptlar', 'ru': 'Рецепты'},
    'profile_saved': {'uz': 'Saqlangan', 'ru': 'Сохранено'},
    'profile_categories': {'uz': 'Toifalar', 'ru': 'Категории'},
    'profile_personal_info': {'uz': "Shaxsiy ma'lumotlar", 'ru': 'Личные данные'},
    'profile_notifications': {'uz': 'Bildirishnomalar', 'ru': 'Уведомления'},
    'profile_settings': {'uz': 'Sozlamalar', 'ru': 'Настройки'},
    'profile_logout': {'uz': 'Chiqish', 'ru': 'Выйти'},

    // ---- Settings ----
    'settings_title': {'uz': 'Sozlamalar', 'ru': 'Настройки'},
    'settings_language': {'uz': 'TIL', 'ru': 'ЯЗЫК'},
    'settings_dark_mode': {'uz': "Qorong'u rejim", 'ru': 'Тёмный режим'},
    'settings_dark_mode_sub': {'uz': "Tungi ko'rinish", 'ru': 'Ночной вид'},
    'settings_notifications_sub': {'uz': 'Yangi retseptlar', 'ru': 'Новые рецепты'},
    'settings_about': {'uz': 'Dastur haqida', 'ru': 'О приложении'},
    'settings_rate': {'uz': 'Baholash', 'ru': 'Оценить'},

    // ---- Completion ----
    'completion_title': {'uz': 'Tayyorlandi!', 'ru': 'Готово!'},
    'completion_calories': {'uz': 'kcal', 'ru': 'ккал'},
    'btn_share': {'uz': 'Ulashish', 'ru': 'Поделиться'},
    'btn_save': {'uz': 'Saqlash', 'ru': 'Сохранить'},
    'btn_back_home': {'uz': 'Bosh sahifaga qaytish', 'ru': 'Вернуться на главную'},
  };

  /// Berilgan til kodi ('uz' | 'ru') va kalit bo'yicha matnni qaytaradi.
  /// Topilmasa 'uz'ga, undan ham topilmasa kalitning o'ziga qaytadi.
  static String t(String lang, String key) {
    return _strings[key]?[lang] ?? _strings[key]?['uz'] ?? key;
  }
}
