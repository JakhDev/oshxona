/// Ilova matnlarining uz/ru tarjimalari lug'ati.
/// Foydalanish: AppState.t('login_title') orqali chaqiriladi.
class AppLocalizations {
  static const Map<String, Map<String, String>> _strings = {
    // Umumiy
    'app_name': {'uz': 'Oshxona', 'ru': 'Ошхона'},
    'app_tagline': {
      'uz': "Milliy va Yevropa taomlari retseptlari",
      'ru': 'Рецепты национальных и европейских блюд',
    },
    'see_all': {'uz': 'Barchasi', 'ru': 'Все'},
    'email': {'uz': 'Email', 'ru': 'Email'},
    'password': {'uz': 'Parol', 'ru': 'Пароль'},
    'name': {'uz': 'Ism', 'ru': 'Имя'},

    // Kirish ekrani
    'login_title': {'uz': 'Kirish', 'ru': 'Вход'},
    'login_subtitle': {'uz': 'Hisobingizga kiring', 'ru': 'Войдите в аккаунт'},
    'login_demo_hint': {
      'uz': 'Demo: demo@oshxona.uz / demo123',
      'ru': 'Демо: demo@oshxona.uz / demo123',
    },
    'login_google': {'uz': 'Google orqali kirish', 'ru': 'Войти через Google'},
    'login_no_account': {'uz': "Hisob yo'qmi? ", 'ru': 'Нет аккаунта? '},
    'login_error': {
      'uz': "Email yoki parol noto'g'ri",
      'ru': 'Неверный email или пароль',
    },
    'btn_login': {'uz': 'Kirish', 'ru': 'Войти'},
    'register_link': {'uz': "Ro'yxatdan o'tish", 'ru': 'Регистрация'},

    // Ro'yxatdan o'tish ekrani
    'register_title': {'uz': "Ro'yxatdan o'tish", 'ru': 'Регистрация'},
    'name_hint': {'uz': 'Ismingiz', 'ru': 'Ваше имя'},
    'password_create_hint': {'uz': 'Parol yarating', 'ru': 'Создайте пароль'},
    'confirm_password': {'uz': 'Parolni tasdiqlang', 'ru': 'Подтвердите пароль'},
    'confirm_password_hint': {'uz': 'Qayta kiriting', 'ru': 'Введите ещё раз'},
    'agree_terms': {
      'uz': 'Foydalanish shartlariga roziman',
      'ru': 'Я согласен с условиями использования',
    },
    'btn_create_account': {'uz': 'Hisob yaratish', 'ru': 'Создать аккаунт'},
    'register_error_empty': {
      'uz': 'Barcha maydonlarni to\'ldiring',
      'ru': 'Заполните все поля',
    },
    'register_error_agree': {
      'uz': 'Foydalanish shartlariga rozilik bering',
      'ru': 'Примите условия использования',
    },
    'register_error_match': {
      'uz': 'Parollar mos kelmadi',
      'ru': 'Пароли не совпадают',
    },
    'register_success': {
      'uz': "Hisob muvaffaqiyatli yaratildi!",
      'ru': 'Аккаунт успешно создан!',
    },

    // Bosh ekran
    'greeting_morning': {'uz': 'Xayrli kun,', 'ru': 'Добрый день,'},
    'search_hint': {'uz': 'Retsept qidiring...', 'ru': 'Поиск рецептов...'},
    'categories_title': {'uz': 'Kategoriyalar', 'ru': 'Категории'},
    'popular_recipes': {'uz': 'Mashhur retseptlar', 'ru': 'Популярные рецепты'},

    // Kategoriyalar
    'recipe_count_suffix': {'uz': 'ta retsept', 'ru': 'рецептов'},
    'recipe_count_special_suffix': {'uz': 'ta maxsus retsept', 'ru': 'специальных рецептов'},

    // Salatlar
    'salads_title': {'uz': 'Salatlar', 'ru': 'Салаты'},
    'salads_subtitle': {
      'uz': 'Yengil va foydali salatlar to\'plami',
      'ru': 'Подборка лёгких и полезных салатов',
    },

    // Diabet menyu
    'diabetic_title': {'uz': 'Diabet uchun', 'ru': 'Для диабетиков'},
    'diabetic_subtitle': {
      'uz': 'Past glisemik indeksli taomlar',
      'ru': 'Блюда с низким гликемическим индексом',
    },

    // Qidiruv
    'search_title': {'uz': 'Qidiruv', 'ru': 'Поиск'},
    'search_results_found': {'uz': 'natija topildi', 'ru': 'результатов найдено'},
    'search_no_results': {'uz': 'Hech narsa topilmadi', 'ru': 'Ничего не найдено'},

    // Profil
    'profile_recipes': {'uz': 'Retseptlar', 'ru': 'Рецепты'},
    'profile_saved': {'uz': 'Saqlangan', 'ru': 'Сохранено'},
    'profile_categories': {'uz': 'Toifalar', 'ru': 'Категории'},
    'profile_personal_info': {'uz': "Shaxsiy ma'lumotlar", 'ru': 'Личные данные'},
    'profile_notifications': {'uz': 'Bildirishnomalar', 'ru': 'Уведомления'},
    'profile_settings': {'uz': 'Sozlamalar', 'ru': 'Настройки'},
    'profile_logout': {'uz': 'Chiqish', 'ru': 'Выйти'},
  };

  /// Berilgan tilga mos matnni qaytaradi. Topilmasa kalitning o'zini qaytaradi.
  static String t(String lang, String key) {
    return _strings[key]?[lang] ?? _strings[key]?['uz'] ?? key;
  }
}