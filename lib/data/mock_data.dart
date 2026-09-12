import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';

/// MVP prototip uchun barcha ma'lumotlar shu yerda statik saqlanadi
/// (uz va ru tillarida). Kelajakda bu klassni Firebase/REST API bilan
/// almashtirish mumkin.
class MockData {
  static final List<RecipeCategory> categories = [
    const RecipeCategory(
      id: 'ozbek',
      title: {'uz': "O'zbek taomlar", 'ru': 'Узбекские блюда'},
      emoji: '🍲',
      color: AppColors.primary,
      recipeCount: 24,
    ),
    const RecipeCategory(
      id: 'turk',
      title: {'uz': 'Turk taomlar', 'ru': 'Турецкие блюда'},
      emoji: '🥙',
      color: AppColors.yellow,
      recipeCount: 18,
    ),
    const RecipeCategory(
      id: 'yevropa',
      title: {'uz': 'Yevropa taomlar', 'ru': 'Европейские блюда'},
      emoji: '🍝',
      color: Color(0xFFE8734A),
      recipeCount: 20,
    ),
    const RecipeCategory(
      id: 'diabet',
      title: {'uz': 'Diabet uchun', 'ru': 'Для диабетиков'},
      emoji: '💚',
      color: AppColors.green,
      recipeCount: 12,
    ),
  ];

  static final Recipe palov = Recipe(
    id: 'palov',
    title: {'uz': 'Osh (palov)', 'ru': 'Плов'},
    categoryId: 'ozbek',
    emoji: '🍲',
    bgColor: const Color(0xFFFBD9C8),
    durationMin: 90,
    calories: 450,
    servings: 4,
    difficulty: {'uz': "O'rta", 'ru': 'Средне'},
    rating: 4.9,
    ingredients: const {
      'uz': ['500g guruch', "400g go'sht", '3 ta sabzi', '2 ta piyoz', 'Zira, tuz, moy'],
      'ru': ['500г риса', '400г мяса', '3 моркови', '2 луковицы', 'Зира, соль, масло'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Guruchni yuvish', 'ru': 'Промыть рис'},
        description: {
          'uz': 'Guruchni 3-4 marta iliq suvda yaxshilab yuvib oling',
          'ru': 'Промойте рис 3-4 раза в тёплой воде',
        },
      ),
      CookingStep(
        title: {'uz': 'Sabzini maydalash', 'ru': 'Нарезать морковь'},
        description: {
          'uz': "Sabzini yupqa to'g'ri bo'laklarga kesmang, ingichka bo'lsin",
          'ru': 'Нарежьте морковь тонкой соломкой',
        },
      ),
      CookingStep(
        title: {'uz': 'Moyni qizitish', 'ru': 'Разогреть масло'},
        description: {
          'uz': 'Qozonda moyni yaxshilab qizdirib oling',
          'ru': 'Хорошо разогрейте масло в казане',
        },
      ),
      CookingStep(
        title: {'uz': "Go'sht va sabzavot qovurish", 'ru': 'Обжарить мясо и овощи'},
        description: {
          'uz': "Go'sht va piyozni tilla rangga kirguncha qovuring",
          'ru': 'Обжарьте мясо и лук до золотистого цвета',
        },
      ),
      CookingStep(
        title: {'uz': 'Guruchni solish va damlash', 'ru': 'Добавить рис и томить'},
        description: {
          'uz': "Guruchni tekis yoyib, suv qo'yib pastda damlab qo'ying",
          'ru': 'Выложите рис ровным слоем, залейте водой и томите на медленном огне',
        },
      ),
    ],
  );

  static final Recipe shashlik = Recipe(
    id: 'shashlik',
    title: {'uz': 'Shashlik', 'ru': 'Шашлык'},
    categoryId: 'ozbek',
    emoji: '🍖',
    bgColor: const Color(0xFFF4E3C8),
    durationMin: 60,
    calories: 380,
    servings: 4,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.8,
    ingredients: const {
      'uz': ["800g go'sht", '2 ta piyoz', 'Sirka, tuz, murch'],
      'ru': ['800г мяса', '2 луковицы', 'Уксус, соль, перец'],
    },
    steps: const [
      CookingStep(
        title: {'uz': "Go'shtni marinadlash", 'ru': 'Замариновать мясо'},
        description: {
          'uz': "Go'shtni piyoz va ziravorlar bilan aralashtiring",
          'ru': 'Смешайте мясо с луком и специями',
        },
      ),
      CookingStep(
        title: {'uz': 'Simga tizish', 'ru': 'Нанизать на шампуры'},
        description: {
          'uz': "Go'sht bo'laklarini simga tizib chiqing",
          'ru': 'Нанижите кусочки мяса на шампуры',
        },
      ),
      CookingStep(
        title: {'uz': "Ko'mirda pishirish", 'ru': 'Жарить на углях'},
        description: {
          'uz': "Cho'g'da har tomonini aylantirib pishiring",
          'ru': 'Обжаривайте на углях, переворачивая со всех сторон',
        },
      ),
    ],
  );

  static final Recipe lagmon = Recipe(
    id: 'lagmon',
    title: {'uz': "Lag'mon", 'ru': 'Лагман'},
    categoryId: 'ozbek',
    emoji: '🍜',
    bgColor: const Color(0xFFFBE0DC),
    durationMin: 75,
    calories: 410,
    servings: 4,
    difficulty: {'uz': "O'rta", 'ru': 'Средне'},
    rating: 4.7,
    ingredients: const {
      'uz': ['Xamir', "Go'sht", "Bulg'or qalampiri", 'Pomidor'],
      'ru': ['Тесто', 'Мясо', 'Болгарский перец', 'Помидор'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Xamir tayyorlash', 'ru': 'Приготовить тесто'},
        description: {
          'uz': "Xamirni cho'zib, lag'mon tayyorlang",
          'ru': 'Растяните тесто и приготовьте лапшу',
        },
      ),
      CookingStep(
        title: {'uz': 'Vaje tayyorlash', 'ru': 'Приготовить соус'},
        description: {
          'uz': "Go'sht va sabzavotlarni qovuring",
          'ru': 'Обжарьте мясо и овощи',
        },
      ),
    ],
  );

  static final Recipe manti = Recipe(
    id: 'manti',
    title: {'uz': 'Manti', 'ru': 'Манты'},
    categoryId: 'ozbek',
    emoji: '🥟',
    bgColor: const Color(0xFFFCE3F0),
    durationMin: 50,
    calories: 390,
    servings: 4,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.9,
    ingredients: const {
      'uz': ['Xamir', 'Qiyma', "Qovoq/piyoz"],
      'ru': ['Тесто', 'Фарш', 'Тыква/лук'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Ichak tayyorlash', 'ru': 'Приготовить начинку'},
        description: {
          'uz': 'Qiyma va piyozni aralashtiring',
          'ru': 'Смешайте фарш с луком',
        },
      ),
      CookingStep(
        title: {'uz': "O'rash", 'ru': 'Слепить манты'},
        description: {
          'uz': "Xamirga ichak solib o'rab chiqing",
          'ru': 'Заверните начинку в тесто',
        },
      ),
      CookingStep(
        title: {'uz': "Bug'da pishirish", 'ru': 'Готовить на пару'},
        description: {
          'uz': "Mantiqasqonda 40 daqiqa dam bering",
          'ru': 'Готовьте на пару 40 минут',
        },
      ),
    ],
  );

  static final Recipe shawarma = Recipe(
    id: 'shawarma',
    title: {'uz': 'Shawarma', 'ru': 'Шаурма'},
    categoryId: 'turk',
    emoji: '🌯',
    bgColor: const Color(0xFFF6E7C4),
    durationMin: 45,
    calories: 520,
    servings: 2,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.8,
    ingredients: const {
      'uz': ['Lavash', "Tovuq go'shti", 'Sabzavotlar', 'Sous'],
      'ru': ['Лаваш', 'Куриное мясо', 'Овощи', 'Соус'],
    },
    steps: const [
      CookingStep(
        title: {'uz': "Go'shtni pishirish", 'ru': 'Приготовить мясо'},
        description: {
          'uz': "Tovuq go'shtini ziravorlar bilan qovuring",
          'ru': 'Обжарьте курицу со специями',
        },
      ),
      CookingStep(
        title: {'uz': "O'rash", 'ru': 'Завернуть'},
        description: {
          'uz': "Lavashga hamma narsani solib o'rang",
          'ru': 'Заверните всё в лаваш',
        },
      ),
    ],
  );

  static final Recipe salat = Recipe(
    id: 'salat',
    title: {'uz': 'Sabzavotli salat', 'ru': 'Овощной салат'},
    categoryId: 'diabet',
    emoji: '🥗',
    bgColor: const Color(0xFFDFF3E1),
    durationMin: 30,
    calories: 120,
    servings: 2,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.6,
    isDiabetic: true,
    glycemicNote: const {'uz': 'Gl. past', 'ru': 'Гл. низкий'},
    ingredients: const {
      'uz': ['Bodring', 'Pomidor', "Ko'k piyoz", 'Zaytun moyi'],
      'ru': ['Огурец', 'Помидор', 'Зелёный лук', 'Оливковое масло'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Kesish', 'ru': 'Нарезать'},
        description: {
          'uz': "Sabzavotlarni mayda to'g'rang",
          'ru': 'Мелко нарежьте овощи',
        },
      ),
      CookingStep(
        title: {'uz': 'Aralashtirish', 'ru': 'Смешать'},
        description: {
          'uz': 'Zaytun moyi bilan aralashtiring',
          'ru': 'Заправьте оливковым маслом',
        },
      ),
    ],
  );

  static final Recipe tovuq = Recipe(
    id: 'tovuq',
    title: {'uz': 'Pishirilgan tovuq', 'ru': 'Запечённая курица'},
    categoryId: 'diabet',
    emoji: '🍗',
    bgColor: const Color(0xFFFCEBD3),
    durationMin: 45,
    calories: 180,
    servings: 2,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.7,
    isDiabetic: true,
    glycemicNote: const {'uz': 'Gl. past', 'ru': 'Гл. низкий'},
    ingredients: const {
      'uz': ["Tovuq ko'kragi", 'Ziravorlar', 'Limon'],
      'ru': ['Куриная грудка', 'Специи', 'Лимон'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Marinadlash', 'ru': 'Замариновать'},
        description: {
          'uz': 'Tovuqni limon va ziravorlarga bulang',
          'ru': 'Замочите курицу в лимоне со специями',
        },
      ),
      CookingStep(
        title: {'uz': 'Pishirish', 'ru': 'Запечь'},
        description: {
          'uz': 'Duxovkada 180°C da pishiring',
          'ru': 'Запекайте в духовке при 180°C',
        },
      ),
    ],
  );

  static final Recipe shorva = Recipe(
    id: 'shorva',
    title: {'uz': "Bodring sho'rva", 'ru': 'Огуречный суп'},
    categoryId: 'diabet',
    emoji: '🥒',
    bgColor: const Color(0xFFE1F0DE),
    durationMin: 20,
    calories: 80,
    servings: 2,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.5,
    isDiabetic: true,
    glycemicNote: const {'uz': 'Gl. past', 'ru': 'Гл. низкий'},
    ingredients: const {
      'uz': ['Bodring', 'Ukrop', 'Qatiq'],
      'ru': ['Огурец', 'Укроп', 'Йогурт'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Maydalash', 'ru': 'Измельчить'},
        description: {
          'uz': "Bodringlarni mayda to'g'rang",
          'ru': 'Мелко нарежьте огурцы',
        },
      ),
      CookingStep(
        title: {'uz': 'Aralashtirish', 'ru': 'Смешать'},
        description: {
          'uz': "Qatiq bilan aralashtirib xizmat qiling",
          'ru': 'Смешайте с йогуртом и подавайте',
        },
      ),
    ],
  );

  static final Recipe palovKokmosh = Recipe(
    id: 'palov_kokmosh',
    title: {'uz': "Palov ko'kmosh", 'ru': 'Плов с зеленью'},
    categoryId: 'ozbek',
    emoji: '🍚',
    bgColor: const Color(0xFFF6DEC0),
    durationMin: 70,
    calories: 400,
    servings: 4,
    difficulty: {'uz': 'Oson', 'ru': 'Легко'},
    rating: 4.6,
    ingredients: const {
      'uz': ['Guruch', "Ko'katlar", 'Moy'],
      'ru': ['Рис', 'Зелень', 'Масло'],
    },
    steps: const [
      CookingStep(
        title: {'uz': 'Tayyorlash', 'ru': 'Приготовить'},
        description: {
          'uz': "Ko'katlarni maydalab qovuring",
          'ru': 'Мелко нарежьте и обжарьте зелень',
        },
      ),
    ],
  );

  /// Barcha retseptlar bitta ro'yxatda
  static List<Recipe> get allRecipes => [
        palov,
        shashlik,
        lagmon,
        manti,
        shawarma,
        salat,
        tovuq,
        shorva,
        palovKokmosh,
      ];

  static List<Recipe> get popularRecipes => [palov, shawarma];

  static List<Recipe> byCategory(String categoryId) {
    if (categoryId == 'diabet') {
      return allRecipes.where((r) => r.isDiabetic).toList();
    }
    return allRecipes.where((r) => r.categoryId == categoryId).toList();
  }

  static List<Recipe> search(String query, String lang) {
    if (query.trim().isEmpty) return [];
    final q = query.toLowerCase();
    return allRecipes.where((r) => r.titleFor(lang).toLowerCase().contains(q)).toList();
  }
}
