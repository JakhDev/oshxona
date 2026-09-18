import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';

/// MVP prototip uchun barcha ma'lumotlar shu yerda statik saqlanadi
<<<<<<< HEAD
/// (uz va ru tillarida). Bu fayl Supabase'ga bir martalik "seed"
/// qilish manbai sifatida ishlatiladi (lib/data/seed_supabase.dart orqali).
class MockData {
  static final List<RecipeCategory> categories = [
    const RecipeCategory(
=======
/// (uz va ru tillarida). Kelajakda bu klassni Firebase/REST API bilan
/// almashtirish mumkin.
class MockData {
  // ---- Yordamchi qurilmalar (boilerplate'ni qisqartirish uchun) ----
  static CookingStep _st(String tUz, String dUz, String tRu, String dRu) =>
      CookingStep(title: {'uz': tUz, 'ru': tRu}, description: {'uz': dUz, 'ru': dRu});

  static Recipe _r({
    required String id,
    required String uz,
    required String ru,
    required String categoryId,
    required String emoji,
    required Color bg,
    required int min,
    required int kcal,
    required int servings,
    required String diffUz,
    required String diffRu,
    required double rating,
    required List<String> ingUz,
    required List<String> ingRu,
    required List<CookingStep> steps,
    bool diabetic = false,
    String? glyUz,
    String? glyRu,
  }) =>
      Recipe(
        id: id,
        title: {'uz': uz, 'ru': ru},
        categoryId: categoryId,
        emoji: emoji,
        bgColor: bg,
        durationMin: min,
        calories: kcal,
        servings: servings,
        difficulty: {'uz': diffUz, 'ru': diffRu},
        rating: rating,
        ingredients: {'uz': ingUz, 'ru': ingRu},
        steps: steps,
        isDiabetic: diabetic,
        glycemicNote: glyUz == null ? null : {'uz': glyUz, 'ru': glyRu ?? glyUz},
      );

  static final List<RecipeCategory> categories = [
    const RecipeCategory(
      id: 'diabet',
      title: {'uz': 'Diabet uchun', 'ru': 'Для диабетиков'},
      emoji: '💚',
      color: AppColors.green,
      recipeCount: 10,
    ),
    const RecipeCategory(
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      id: 'ozbek',
      title: {'uz': "O'zbek taomlar", 'ru': 'Узбекские блюда'},
      emoji: '🍲',
      color: AppColors.primary,
<<<<<<< HEAD
      recipeCount: 24,
=======
      recipeCount: 10,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    ),
    const RecipeCategory(
      id: 'turk',
      title: {'uz': 'Turk taomlar', 'ru': 'Турецкие блюда'},
      emoji: '🥙',
      color: AppColors.yellow,
<<<<<<< HEAD
      recipeCount: 18,
=======
      recipeCount: 10,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    ),
    const RecipeCategory(
      id: 'yevropa',
      title: {'uz': 'Yevropa taomlar', 'ru': 'Европейские блюда'},
      emoji: '🍝',
      color: Color(0xFFE8734A),
<<<<<<< HEAD
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

=======
      recipeCount: 10,
    ),
    // Eslatma: "Salatlar" kategoriyasi bu ro'yxatdan olib tashlandi,
    // lekin pastki navigatsiyadagi "Salatlar" bo'limi (salads_screen.dart)
    // categoryId == 'salatlar' orqali o'z retseptlarini ko'rsatishda davom etadi.
  ];

  // =========================================================================
  // O'ZBEK TAOMLARI (10 ta)
  // =========================================================================

>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
      'uz': ['Xamir', 'Qiyma', 'Qovoq/piyoz'],
=======
      'uz': ['Xamir', 'Qiyma', "Qovoq/piyoz"],
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
          'uz': 'Mantiqasqonda 40 daqiqa dam bering',
=======
          'uz': "Mantiqasqonda 40 daqiqa dam bering",
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          'ru': 'Готовьте на пару 40 минут',
        },
      ),
    ],
  );

<<<<<<< HEAD
=======
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

  static final Recipe norin = _r(
    id: 'norin',
    uz: 'Norin',
    ru: 'Нарын',
    categoryId: 'ozbek',
    emoji: '🍝',
    bg: const Color(0xFFE3ECFB),
    min: 80,
    kcal: 430,
    servings: 4,
    diffUz: 'Qiyin',
    diffRu: 'Сложно',
    rating: 4.7,
    ingUz: ['500g qazi/go\'sht', '400g xamir', '2 ta piyoz', 'Murch, tuz'],
    ingRu: ['500г казы/мяса', '400г теста', '2 луковицы', 'Перец, соль'],
    steps: [
      _st('Etni qaynatish', "Go'shtni suvda 1.5 soat qaynating", 'Сварить мясо',
          'Отварите мясо в воде 1,5 часа'),
      _st('Xamir tayyorlash', "Yupqa xamir yoyib, tasma qilib to'g'rang",
          'Приготовить тесто', 'Раскатайте тонкое тесто и нарежьте полосками'),
      _st('Aralashtirish', "Go'sht, xamir va piyozni aralashtirib xizmat qiling",
          'Смешать', 'Смешайте мясо, тесто и лук, подавайте'),
    ],
  );

  static final Recipe dimlama = _r(
    id: 'dimlama',
    uz: 'Dimlama',
    ru: 'Димлама',
    categoryId: 'ozbek',
    emoji: '🥘',
    bg: const Color(0xFFEAF4E0),
    min: 100,
    kcal: 360,
    servings: 5,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ["Go'sht", 'Kartoshka', 'Karam', 'Sabzi, piyoz, pomidor'],
    ingRu: ['Мясо', 'Картофель', 'Капуста', 'Морковь, лук, помидор'],
    steps: [
      _st('Qatlamlash', "Sabzavotlarni qatlab qozonga joylang", 'Уложить слоями',
          'Уложите овощи слоями в казан'),
      _st('Dimlash', "Qopqoqni yopib, past olovda 1.5 soat dimlang", 'Тушить',
          'Закройте крышкой и тушите на слабом огне 1,5 часа'),
    ],
  );

  static final Recipe chuchvara = _r(
    id: 'chuchvara',
    uz: 'Chuchvara',
    ru: 'Чучвара',
    categoryId: 'ozbek',
    emoji: '🥟',
    bg: const Color(0xFFF9E4EC),
    min: 60,
    kcal: 370,
    servings: 4,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ['Xamir', "Mayda qiyma", 'Piyoz, tuz, murch'],
    ingRu: ['Тесто', 'Мелкий фарш', 'Лук, соль, перец'],
    steps: [
      _st("Xamir yoyish", "Yupqa xamir yoyib, kvadrat qilib kesing", 'Раскатать тесто',
          'Раскатайте тонкое тесто и нарежьте квадратиками'),
      _st("Ichak solish", "Har biriga ozgina qiyma qo'yib biriktiring", 'Слепить',
          'Положите немного фарша и слепите'),
      _st("Qaynatish", "Qaynagan sho'rvada 10 daqiqa qaynating", 'Отварить',
          'Варите в кипящем бульоне 10 минут'),
    ],
  );

  static final Recipe somsa = _r(
    id: 'somsa',
    uz: 'Somsa',
    ru: 'Самса',
    categoryId: 'ozbek',
    emoji: '🥐',
    bg: const Color(0xFFFFF0D9),
    min: 55,
    kcal: 420,
    servings: 6,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ['Yupqa xamir', "Qiyma yoki qovoq", 'Piyoz, ziravorlar'],
    ingRu: ['Слоёное тесто', 'Фарш или тыква', 'Лук, специи'],
    steps: [
      _st('Ichak tayyorlash', "Qiyma yoki qovoqni piyoz bilan aralashtiring",
          'Приготовить начинку', 'Смешайте фарш или тыкву с луком'),
      _st("O'rash", "Xamirga ichak solib uchburchak qilib o'rang", 'Завернуть',
          'Заверните начинку в тесто треугольником'),
      _st('Tandirda pishirish', "180°C da 30-35 daqiqa toki qizarguncha pishiring",
          'Испечь в тандыре', 'Выпекайте при 180°C 30-35 минут до золотистой корочки'),
    ],
  );

  static final Recipe mastava = _r(
    id: 'mastava',
    uz: 'Mastava',
    ru: 'Мастава',
    categoryId: 'ozbek',
    emoji: '🍲',
    bg: const Color(0xFFFDEBDD),
    min: 45,
    kcal: 260,
    servings: 4,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Guruch', "Go'sht", 'Kartoshka, sabzi, pomidor'],
    ingRu: ['Рис', 'Мясо', 'Картофель, морковь, помидор'],
    steps: [
      _st("Go'shtni qovurish", "Go'sht va sabzavotlarni qovuring", 'Обжарить мясо',
          'Обжарьте мясо с овощами'),
      _st('Qaynatish', "Suv va guruch qo'shib 25 daqiqa qaynating", 'Варить',
          'Добавьте воду и рис, варите 25 минут'),
    ],
  );

  // =========================================================================
  // TURK TAOMLARI (10 ta)
  // =========================================================================

>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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

<<<<<<< HEAD
=======
  static final Recipe kebab = _r(
    id: 'kebab',
    uz: 'Adana kebab',
    ru: 'Адана кебаб',
    categoryId: 'turk',
    emoji: '🍢',
    bg: const Color(0xFFF4E3C8),
    min: 50,
    kcal: 470,
    servings: 3,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ["Qiyma (qo'y go'shti)", 'Achchiq qalampir', 'Ziravorlar'],
    ingRu: ['Фарш (баранина)', 'Острый перец', 'Специи'],
    steps: [
      _st('Qiyma tayyorlash', "Qiymani achchiq qalampir va ziravor bilan yo'gʻiring",
          'Приготовить фарш', 'Замесите фарш с острым перцем и специями'),
      _st('Simga taqash', "Qiymani simga cho'zib taqang", 'Насадить на шампур',
          'Насадите фарш на шампур, растянув по длине'),
      _st('Ko\'mirda pishirish', "Har tomonini 4-5 daqiqadan pishiring",
          'Жарить на углях', 'Жарьте с каждой стороны по 4-5 минут'),
    ],
  );

  static final Recipe lahmajun = _r(
    id: 'lahmajun',
    uz: 'Lahmajun',
    ru: 'Лахмаджун',
    categoryId: 'turk',
    emoji: '🍕',
    bg: const Color(0xFFFBE0DC),
    min: 45,
    kcal: 300,
    servings: 4,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.6,
    ingUz: ['Yupqa xamir', "Mayda qiyma", 'Pomidor, piyoz, ziravor'],
    ingRu: ['Тонкое тесто', 'Мелкий фарш', 'Помидор, лук, специи'],
    steps: [
      _st('Aralashma tayyorlash', "Qiyma, pomidor va piyozni mayda maydalab aralashtiring",
          'Приготовить смесь', 'Мелко нарежьте и смешайте фарш, помидор и лук'),
      _st('Xamirga surtish', "Yupqa xamirga yupqa qilib surting", 'Намазать на тесто',
          'Тонким слоем намажьте на раскатанное тесто'),
      _st('Pishirish', "230°C da 8-10 daqiqa pishiring", 'Выпечь',
          'Выпекайте при 230°C 8-10 минут'),
    ],
  );

  static final Recipe pide = _r(
    id: 'pide',
    uz: 'Turk pidesi',
    ru: 'Турецкая пиде',
    categoryId: 'turk',
    emoji: '🥖',
    bg: const Color(0xFFFCE3F0),
    min: 60,
    kcal: 410,
    servings: 3,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.7,
    ingUz: ['Xamir', 'Pishloq', "Qiyma yoki tuxum"],
    ingRu: ['Тесто', 'Сыр', 'Фарш или яйцо'],
    steps: [
      _st('Qayiq shakllantirish', "Xamirni qayiqsimon shaklga solib bortini buring",
          'Сформировать лодочку', 'Сформируйте тесто в форме лодочки, загнув края'),
      _st('Ichini to\'ldirish', "Pishloq va qiyma bilan to'ldiring", 'Наполнить начинкой',
          'Наполните сыром и фаршем'),
      _st('Pishirish', "220°C da 15 daqiqa pishiring", 'Выпечь',
          'Выпекайте при 220°C 15 минут'),
    ],
  );

  static final Recipe baklava = _r(
    id: 'baklava',
    uz: 'Baklava',
    ru: 'Пахлава',
    categoryId: 'turk',
    emoji: '🍰',
    bg: const Color(0xFFFFF0D9),
    min: 70,
    kcal: 480,
    servings: 8,
    diffUz: 'Qiyin',
    diffRu: 'Сложно',
    rating: 4.9,
    ingUz: ['Yupqa xamir varaqlari', "Yong'oq", 'Sariyog\', shakar siropi'],
    ingRu: ['Тонкие листы теста', 'Орехи', 'Масло, сахарный сироп'],
    steps: [
      _st("Qatlash", "Xamir varaqlarini sariyog' bilan qatlab chiqing", 'Уложить слоями',
          'Уложите листы теста слоями, смазывая маслом'),
      _st("Yong'oq sepish", "Har bir necha qatlamda maydalangan yong'oq sepib boring",
          'Посыпать орехами', 'Через каждые несколько слоёв посыпайте измельчёнными орехами'),
      _st('Pishirish va sirop', "180°C da pishirib, issiqligida shakar siropi quying",
          'Испечь и полить сиропом', 'Выпеките при 180°C и полейте горячим сахарным сиропом'),
    ],
  );

  static final Recipe iskender = _r(
    id: 'iskender',
    uz: 'Iskender kebab',
    ru: 'Искендер кебаб',
    categoryId: 'turk',
    emoji: '🍖',
    bg: const Color(0xFFEAF4E0),
    min: 55,
    kcal: 540,
    servings: 3,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ["Go'sht (doner)", 'Non', 'Pomidor sousi, qatiq, sariyog\''],
    ingRu: ['Мясо (донер)', 'Хлеб', 'Томатный соус, йогурт, масло'],
    steps: [
      _st("Go'shtni pishirish", "Yupqa kesilgan go'shtni qovuring", 'Приготовить мясо',
          'Обжарьте тонко нарезанное мясо'),
      _st('Nonga joylash', "Kesilgan nonlar ustiga go'shtni yoying", 'Выложить на хлеб',
          'Выложите мясо на нарезанный хлеб'),
      _st('Sous quyish', "Pomidor sousi, eritilgan sariyog' va qatiq bilan bezang",
          'Полить соусом', 'Полейте томатным соусом, топлёным маслом и йогуртом'),
    ],
  );

  static final Recipe kayseriManti = _r(
    id: 'kayseri_manti',
    uz: 'Turk mantisi (Kayseri)',
    ru: 'Турецкие манты (Кайсери)',
    categoryId: 'turk',
    emoji: '🥟',
    bg: const Color(0xFFF9E4EC),
    min: 65,
    kcal: 400,
    servings: 4,
    diffUz: 'Qiyin',
    diffRu: 'Сложно',
    rating: 4.7,
    ingUz: ['Xamir', "Mayda qiyma", 'Qatiq, sarimsoq, qizil murch yog\'i'],
    ingRu: ['Тесто', 'Мелкий фарш', 'Йогурт, чеснок, масло с перцем'],
    steps: [
      _st('Kichik mantilar', "Xamirni juda kichik kvadratlarga kesib qiyma solib biriktiring",
          'Слепить мини-манты', 'Нарежьте тесто мелкими квадратами и слепите с фаршем'),
      _st('Qaynatish', "Qaynagan suvda 12-15 daqiqa qaynating", 'Отварить',
          'Варите в кипящей воде 12-15 минут'),
      _st('Sous bilan bezash', "Sarimsoqli qatiq va qizil murch yog'i bilan xizmat qiling",
          'Полить соусом', 'Подавайте с чесночным йогуртом и маслом с красным перцем'),
    ],
  );

  static final Recipe mercimekShorva = _r(
    id: 'mercimek_shorva',
    uz: 'Mercimek sho\'rva (yasmiq)',
    ru: 'Мерджимек чорба (чечевичный суп)',
    categoryId: 'turk',
    emoji: '🍲',
    bg: const Color(0xFFFDEBDD),
    min: 40,
    kcal: 220,
    servings: 4,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Qizil yasmiq', 'Sabzi, piyoz, kartoshka', 'Pomidor pastasi'],
    ingRu: ['Красная чечевица', 'Морковь, лук, картофель', 'Томатная паста'],
    steps: [
      _st('Qovurish', "Piyoz va sabzini pomidor pastasi bilan qovuring", 'Обжарить',
          'Обжарьте лук и морковь с томатной пастой'),
      _st('Qaynatish', "Yasmiq va suv qo'shib 25 daqiqa qaynating", 'Варить',
          'Добавьте чечевицу и воду, варите 25 минут'),
      _st('Bluenderlash', "Blenderda silliq bo'lguncha maydalang", 'Измельчить',
          'Измельчите блендером до однородности'),
    ],
  );

  static final Recipe simit = _r(
    id: 'simit',
    uz: 'Simit',
    ru: 'Симит',
    categoryId: 'turk',
    emoji: '🥯',
    bg: const Color(0xFFE3ECFB),
    min: 90,
    kcal: 280,
    servings: 6,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.5,
    ingUz: ['Xamir (achitqili)', 'Kunjut', "Shinni (pekmez)"],
    ingRu: ['Дрожжевое тесто', 'Кунжут', 'Сироп пекмез'],
    steps: [
      _st('Halqa shakllantirish', "Xamirdan halqa (bagel) shaklida burang", 'Сформировать кольцо',
          'Сформируйте из теста форму кольца'),
      _st('Shinniga botirish', "Halqalarni shinni-suv aralashmasiga botirib kunjutga aylantiring",
          'Обмакнуть в сироп', 'Обмакните в смесь пекмеза с водой и обваляйте в кунжуте'),
      _st('Pishirish', "220°C da 20 daqiqa pishiring", 'Выпечь', 'Выпекайте при 220°C 20 минут'),
    ],
  );

  static final Recipe kofte = _r(
    id: 'kofte',
    uz: 'Kofte (turk kotleti)',
    ru: 'Кёфте (турецкие котлеты)',
    categoryId: 'turk',
    emoji: '🍖',
    bg: const Color(0xFFFFF0D9),
    min: 35,
    kcal: 350,
    servings: 4,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.7,
    ingUz: ["Qiyma", 'Piyoz, non ushog\'i', 'Ziravorlar'],
    ingRu: ['Фарш', 'Лук, панировочные сухари', 'Специи'],
    steps: [
      _st('Aralashtirish', "Qiyma, piyoz va ziravorlarni yaxshilab yo'gʻiring", 'Смешать',
          'Хорошо вымешайте фарш с луком и специями'),
      _st('Shakl berish', "Kichik oval kotletlar shakllantiring", 'Сформировать',
          'Сформируйте небольшие овальные котлеты'),
      _st('Qovurish', "Ikki tomonini oltin rang bo'lguncha qovuring", 'Обжарить',
          'Обжарьте с двух сторон до золотистого цвета'),
    ],
  );

  // =========================================================================
  // YEVROPA TAOMLARI (10 ta)
  // =========================================================================

  static final Recipe pizza = _r(
    id: 'pizza',
    uz: 'Margarita pitsa',
    ru: 'Пицца Маргарита',
    categoryId: 'yevropa',
    emoji: '🍕',
    bg: const Color(0xFFF6E7C4),
    min: 50,
    kcal: 460,
    servings: 4,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ['Pitsa xamiri', 'Pomidor sousi', 'Mozzarella, rayhon'],
    ingRu: ['Тесто для пиццы', 'Томатный соус', 'Моцарелла, базилик'],
    steps: [
      _st('Xamir yoyish', "Xamirni yumaloq va yupqa qilib yoying", 'Раскатать тесто',
          'Раскатайте тесто в тонкий круг'),
      _st('Sous va sir', "Pomidor sousi surtib mozzarella yoying", 'Соус и сыр',
          'Намажьте томатный соус и выложите моцареллу'),
      _st('Pishirish', "250°C da 10-12 daqiqa pishiring, rayhon sepib xizmat qiling",
          'Выпечь', 'Выпекайте при 250°C 10-12 минут, подавайте с базиликом'),
    ],
  );

  static final Recipe pastaCarbonara = _r(
    id: 'pasta_carbonara',
    uz: 'Pasta karbonara',
    ru: 'Паста карбонара',
    categoryId: 'yevropa',
    emoji: '🍝',
    bg: const Color(0xFFFBE0DC),
    min: 30,
    kcal: 520,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.8,
    ingUz: ['Spagetti', 'Bekon', "Tuxum, parmezan"],
    ingRu: ['Спагетти', 'Бекон', 'Яйцо, пармезан'],
    steps: [
      _st('Pastani qaynatish', "Spagettini tuzli suvda qaynating", 'Отварить пасту',
          'Отварите спагетти в подсоленной воде'),
      _st('Bekon qovurish', "Bekonni qarsildoq bo'lguncha qovuring", 'Обжарить бекон',
          'Обжарьте бекон до хрустящей корочки'),
      _st('Aralashtirish', "Tuxum-parmezan aralashmasi bilan issiq pastani aralashtiring",
          'Смешать', 'Смешайте горячую пасту со смесью яйца и пармезана'),
    ],
  );

  static final Recipe lasagna = _r(
    id: 'lasagna',
    uz: 'Lazanya',
    ru: 'Лазанья',
    categoryId: 'yevropa',
    emoji: '🍝',
    bg: const Color(0xFFFCE3F0),
    min: 80,
    kcal: 480,
    servings: 6,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.7,
    ingUz: ['Lazanya varaqlari', "Qiyma", 'Bexamel sous, pishloq'],
    ingRu: ['Листы лазаньи', 'Фарш', 'Соус бешамель, сыр'],
    steps: [
      _st("Sous tayyorlash", "Qiyma va pomidor sousini qovuring", 'Приготовить соус',
          'Обжарьте фарш и приготовьте томатный соус'),
      _st('Qatlash', "Varaq, qiyma va bexamelni navbatma-navbat qatlang", 'Уложить слоями',
          'Уложите слоями листы, фарш и бешамель'),
      _st('Pishirish', "190°C da 40 daqiqa pishiring", 'Запечь',
          'Запекайте при 190°C 40 минут'),
    ],
  );

  static final Recipe pancake = _r(
    id: 'pancake',
    uz: 'Bliny (quymoq)',
    ru: 'Блины',
    categoryId: 'yevropa',
    emoji: '🥞',
    bg: const Color(0xFFFFF0D9),
    min: 25,
    kcal: 300,
    servings: 4,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Un', 'Tuxum, sut', 'Shakar, tuz'],
    ingRu: ['Мука', 'Яйцо, молоко', 'Сахар, соль'],
    steps: [
      _st("Xamir aralashtirish", "Barcha masalliqlarni silliq bo'lguncha aralashtiring",
          'Замесить тесто', 'Смешайте все ингредиенты до однородности'),
      _st('Pishirish', "Tovada ikki tomonini oltin rangga kelguncha pishiring", 'Жарить',
          'Жарьте на сковороде с двух сторон до золотистого цвета'),
    ],
  );

  static final Recipe burger = _r(
    id: 'burger',
    uz: 'Burger',
    ru: 'Бургер',
    categoryId: 'yevropa',
    emoji: '🍔',
    bg: const Color(0xFFEAF4E0),
    min: 30,
    kcal: 540,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.7,
    ingUz: ['Burger bulochkasi', "Go'sht kotleti", 'Salat, pomidor, sous'],
    ingRu: ['Булочка для бургера', 'Котлета', 'Салат, помидор, соус'],
    steps: [
      _st('Kotlet qovurish', "Go'sht kotletini har tomonini 4 daqiqa qovuring",
          'Обжарить котлету', 'Обжарьте котлету по 4 минуты с каждой стороны'),
      _st('Yig\'ish', "Bulochkaga salat, kotlet, pomidor va sousni qatlab qo'ying",
          'Собрать', 'Соберите бургер, уложив слоями салат, котлету, помидор и соус'),
    ],
  );

  static final Recipe steak = _r(
    id: 'steak',
    uz: 'Steak',
    ru: 'Стейк',
    categoryId: 'yevropa',
    emoji: '🥩',
    bg: const Color(0xFFF9E4EC),
    min: 25,
    kcal: 430,
    servings: 1,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.8,
    ingUz: ["Mol go'shti", 'Sariyog\', sarimsoq', 'Tuz, murch'],
    ingRu: ['Говядина', 'Масло, чеснок', 'Соль, перец'],
    steps: [
      _st('Tayyorlash', "Go'shtni xona haroratiga keltirib tuz-murch sepib qo'ying",
          'Подготовить', 'Доведите мясо до комнатной температуры, посолите и поперчите'),
      _st('Qovurish', "Issiq tovada har tomonini 3-4 daqiqa qovuring", 'Обжарить',
          'Обжарьте на раскалённой сковороде по 3-4 минуты с каждой стороны'),
      _st('Dam olish', "5 daqiqa dam bergandan keyin kesib xizmat qiling", 'Дать отдохнуть',
          'Дайте мясу отдохнуть 5 минут перед подачей'),
    ],
  );

  static final Recipe risotto = _r(
    id: 'risotto',
    uz: 'Rizoto',
    ru: 'Ризотто',
    categoryId: 'yevropa',
    emoji: '🍚',
    bg: const Color(0xFFE3ECFB),
    min: 40,
    kcal: 410,
    servings: 3,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.6,
    ingUz: ['Arborio guruchi', "Bulon", 'Parmezan, piyoz, oq vino'],
    ingRu: ['Рис арборио', 'Бульон', 'Пармезан, лук, белое вино'],
    steps: [
      _st('Qovurish', "Piyozni shaffof bo'lguncha qovurib guruch qo'shing", 'Обжарить',
          'Обжарьте лук до прозрачности, добавьте рис'),
      _st('Bulon qo\'shish', "Bulonni asta-sekin qo'shib doimiy aralashtiring", 'Добавлять бульон',
          'Постепенно добавляйте бульон, постоянно помешивая'),
      _st('Pishirish', "20 daqiqa pishirib, parmezan qo'shing", 'Приготовить',
          'Готовьте 20 минут, в конце добавьте пармезан'),
    ],
  );

  static final Recipe borsch = _r(
    id: 'borsch',
    uz: "Borsh",
    ru: 'Борщ',
    categoryId: 'yevropa',
    emoji: '🍲',
    bg: const Color(0xFFFDEBDD),
    min: 60,
    kcal: 280,
    servings: 5,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.7,
    ingUz: ['Lavlagi', "Go'sht", 'Karam, kartoshka, sabzi'],
    ingRu: ['Свёкла', 'Мясо', 'Капуста, картофель, морковь'],
    steps: [
      _st("Go'shtni qaynatish", "Go'shtli bulon qaynatib oling", 'Сварить бульон',
          'Сварите мясной бульон'),
      _st('Sabzavot qo\'shish', "Lavlagi, karam va kartoshkani qo'shing", 'Добавить овощи',
          'Добавьте свёклу, капусту и картофель'),
      _st('Qaynatish', "40 daqiqa qaynatib, smetana bilan xizmat qiling", 'Варить',
          'Варите 40 минут, подавайте со сметаной'),
    ],
  );

  static final Recipe croissant = _r(
    id: 'croissant',
    uz: 'Kruassan',
    ru: 'Круассан',
    categoryId: 'yevropa',
    emoji: '🥐',
    bg: const Color(0xFFF6DEC0),
    min: 120,
    kcal: 320,
    servings: 6,
    diffUz: 'Qiyin',
    diffRu: 'Сложно',
    rating: 4.5,
    ingUz: ['Xamir', 'Sariyog\'', 'Tuxum (surtish uchun)'],
    ingRu: ['Тесто', 'Масло', 'Яйцо (для смазки)'],
    steps: [
      _st('Qatlash', "Xamir va sariyog'ni bir necha marta qatlab yoying", 'Слоение',
          'Несколько раз сложите тесто с маслом слоями'),
      _st('Shakl berish', "Uchburchaklarga kesib, rulon qiling", 'Сформировать',
          'Нарежьте треугольниками и сверните в рулет'),
      _st('Pishirish', "200°C da 18 daqiqa pishiring", 'Выпечь',
          'Выпекайте при 200°C 18 минут'),
    ],
  );

  static final Recipe omletFrantsuz = _r(
    id: 'omlet_frantsuz',
    uz: 'Fransuz omleti',
    ru: 'Французский омлет',
    categoryId: 'yevropa',
    emoji: '🍳',
    bg: const Color(0xFFEAF4E0),
    min: 15,
    kcal: 250,
    servings: 1,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['3 ta tuxum', 'Sariyog\'', 'Ko\'katlar, tuz'],
    ingRu: ['3 яйца', 'Масло', 'Зелень, соль'],
    steps: [
      _st('Chalish', "Tuxumlarni tuz bilan yengil chalib oling", 'Взбить',
          'Слегка взбейте яйца с солью'),
      _st('Pishirish', "Past olovda doimiy aralashtirib yumshoq holatda pishiring",
          'Приготовить', 'Готовьте на слабом огне, постоянно помешивая, до мягкой текстуры'),
    ],
  );

  // =========================================================================
  // DIABET UCHUN (10 ta)
  // =========================================================================

>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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

<<<<<<< HEAD
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
=======
  static final Recipe bugdaBaliq = _r(
    id: 'bugda_baliq',
    uz: "Bug'da pishirilgan baliq",
    ru: 'Рыба на пару',
    categoryId: 'diabet',
    emoji: '🐟',
    bg: const Color(0xFFE1F0DE),
    min: 25,
    kcal: 160,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Baliq filesi', 'Limon', "Ko'katlar"],
    ingRu: ['Филе рыбы', 'Лимон', 'Зелень'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st('Marinadlash', "Baliqni limon sharbati va ko'katlar bilan bulang", 'Замариновать',
          'Замочите рыбу в лимонном соке с зеленью'),
      _st("Bug'da pishirish", "Bug' qozonida 15 daqiqa pishiring", 'Готовить на пару',
          'Готовьте на пару 15 минут'),
    ],
  );

  static final Recipe sabzavotliOmlet = _r(
    id: 'sabzavotli_omlet',
    uz: 'Sabzavotli omlet',
    ru: 'Омлет с овощами',
    categoryId: 'diabet',
    emoji: '🍳',
    bg: const Color(0xFFDFF3E1),
    min: 15,
    kcal: 190,
    servings: 1,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['2 ta tuxum', "Bulg'or qalampiri", 'Ismaloq'],
    ingRu: ['2 яйца', 'Болгарский перец', 'Шпинат'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st('Sabzavot qovurish', "Qalampir va ismaloqni yengil qovuring", 'Обжарить овощи',
          'Слегка обжарьте перец и шпинат'),
      _st('Tuxum quyish', "Chalingan tuxumni ustidan quyib yopib pishiring", 'Залить яйцом',
          'Залейте взбитым яйцом и готовьте под крышкой'),
    ],
  );

  static final Recipe qovoqShorva = _r(
    id: 'qovoq_shorva',
    uz: "Qovoq sho'rva",
    ru: 'Тыквенный суп',
    categoryId: 'diabet',
    emoji: '🥣',
    bg: const Color(0xFFFCEBD3),
    min: 30,
    kcal: 110,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Qovoq', 'Piyoz', "Zanjabil"],
    ingRu: ['Тыква', 'Лук', 'Имбирь'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st('Qaynatish', "Qovoq va piyozni suvda yumshaguncha qaynating", 'Отварить',
          'Отварите тыкву с луком до мягкости'),
      _st('Bluenderlash', "Zanjabil qo'shib blenderda silliqlang", 'Измельчить',
          'Добавьте имбирь и измельчите блендером'),
    ],
  );

  static final Recipe grechkaKotlet = _r(
    id: 'grechka_kotlet',
    uz: "Grechka va tovuq kotleti",
    ru: 'Гречка с куриной котлетой',
    categoryId: 'diabet',
    emoji: '🍚',
    bg: const Color(0xFFE1F0DE),
    min: 35,
    kcal: 260,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Grechka yormasi', "Tovuq qiymasi", 'Piyoz'],
    ingRu: ['Гречневая крупа', 'Куриный фарш', 'Лук'],
    diabetic: true,
    glyUz: 'Gl. o\'rta',
    glyRu: 'Гл. средний',
    steps: [
      _st('Grechka qaynatish', "Grechkani suvda 15 daqiqa qaynating", 'Отварить гречку',
          'Отварите гречку в воде 15 минут'),
      _st('Kotlet pishirish', "Tovuq kotletlarini yog'siz tovada pishiring", 'Приготовить котлеты',
          'Приготовьте куриные котлеты на сковороде без масла'),
    ],
  );

  static final Recipe tovuqSalatDiet = _r(
    id: 'tovuq_salat_diet',
    uz: 'Diyetik tovuq salati',
    ru: 'Диетический салат с курицей',
    categoryId: 'diabet',
    emoji: '🥗',
    bg: const Color(0xFFDFF3E1),
    min: 20,
    kcal: 210,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Qaynatilgan tovuq', 'Ismaloq', "Bodring"],
    ingRu: ['Отварная курица', 'Шпинат', 'Огурец'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st('Kesish', "Tovuq va sabzavotlarni mayda to'g'rang", 'Нарезать',
          'Нарежьте курицу и овощи'),
      _st('Aralashtirish', "Zaytun moyi va limon sharbati bilan zapravka qiling", 'Заправить',
          'Заправьте оливковым маслом и лимонным соком'),
    ],
  );

  static final Recipe sabzavotAralashma = _r(
    id: 'sabzavot_aralashma',
    uz: "Bug'dagi sabzavotlar aralashmasi",
    ru: 'Овощи на пару',
    categoryId: 'diabet',
    emoji: '🥦',
    bg: const Color(0xFFE1F0DE),
    min: 20,
    kcal: 95,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Brokkoli', 'Gulkaram', "Sabzi"],
    ingRu: ['Брокколи', 'Цветная капуста', 'Морковь'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st("Bug'da pishirish", "Sabzavotlarni bug' qozonida 10 daqiqa pishiring",
          'Готовить на пару', 'Готовьте овощи на пару 10 минут'),
      _st('Ziravorlash', "Zaytun moyi va murch bilan bezang", 'Приправить',
          'Приправьте оливковым маслом и перцем'),
    ],
  );

  static final Recipe findiqYogurt = _r(
    id: 'findiq_yogurt',
    uz: "Yong'oqli qatiq deserti",
    ru: 'Йогуртовый десерт с орехами',
    categoryId: 'diabet',
    emoji: '🥣',
    bg: const Color(0xFFFCEBD3),
    min: 10,
    kcal: 150,
    servings: 1,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Shakarsiz qatiq', "Yong'oq", 'Dolchin'],
    ingRu: ['Йогурт без сахара', 'Орехи', 'Корица'],
    diabetic: true,
    glyUz: 'Gl. past',
    glyRu: 'Гл. низкий',
    steps: [
      _st('Aralashtirish', "Qatiqqa maydalangan yong'oq va dolchin qo'shing", 'Смешать',
          'Добавьте в йогурт измельчённые орехи и корицу'),
    ],
  );

  // =========================================================================
  // SALATLAR (22 ta)
  // =========================================================================

  static final Recipe sezarSalat = _r(
    id: 'sezar_salat',
    uz: 'Sezar salat',
    ru: 'Салат Цезарь',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFDFF3E1),
    min: 20,
    kcal: 280,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.8,
    ingUz: ['Salat barglari', "Tovuq go'shti", 'Krouton, parmezan, sous'],
    ingRu: ['Листья салата', 'Курица', 'Гренки, пармезан, соус'],
    steps: [
      _st("Tovuqni qovurish", "Tovuq filesini qovurib mayda to'g'rang", 'Обжарить курицу',
          'Обжарьте куриное филе и нарежьте'),
      _st('Aralashtirish', "Barcha masalliqlarni sous bilan aralashtiring", 'Смешать',
          'Смешайте все ингредиенты с соусом'),
    ],
  );

  static final Recipe grekSalat = _r(
    id: 'grek_salat',
    uz: 'Grek salati',
    ru: 'Греческий салат',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFEAF4E0),
    min: 15,
    kcal: 220,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.7,
    ingUz: ['Pomidor, bodring', 'Feta pishloq', 'Zaytun, zaytun moyi'],
    ingRu: ['Помидор, огурец', 'Сыр фета', 'Оливки, оливковое масло'],
    steps: [
      _st('Kesish', "Sabzavotlarni yirikroq bo'lakka to'g'rang", 'Нарезать',
          'Нарежьте овощи крупными кусочками'),
      _st('Bezash', "Feta va zaytunlar bilan bezab, moy quying", 'Оформить',
          'Оформите фетой и оливками, полейте маслом'),
    ],
  );

  static final Recipe olivye = _r(
    id: 'olivye',
    uz: 'Olivye salati',
    ru: 'Салат Оливье',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFF6E7C4),
    min: 40,
    kcal: 310,
    servings: 4,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.9,
    ingUz: ['Kartoshka, sabzi', "Kolbasa yoki go'sht", 'Tuxum, no\'xat, mayonez'],
    ingRu: ['Картофель, морковь', 'Колбаса или мясо', 'Яйцо, горошек, майонез'],
    steps: [
      _st('Qaynatish', "Kartoshka, sabzi va tuxumni qaynating", 'Отварить',
          'Отварите картофель, морковь и яйца'),
      _st('Kesish', "Barcha masalliqlarni mayda kub qilib to'g'rang", 'Нарезать',
          'Нарежьте все ингредиенты мелкими кубиками'),
      _st('Aralashtirish', "No'xat va mayonez qo'shib aralashtiring", 'Смешать',
          'Добавьте горошек и майонез, перемешайте'),
    ],
  );

  static final Recipe kapreze = _r(
    id: 'kapreze',
    uz: 'Kapreze salati',
    ru: 'Салат Капрезе',
    categoryId: 'salatlar',
    emoji: '🍅',
    bg: const Color(0xFFFBE0DC),
    min: 10,
    kcal: 210,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Pomidor', 'Mozzarella', "Rayhon, zaytun moyi"],
    ingRu: ['Помидор', 'Моцарелла', 'Базилик, оливковое масло'],
    steps: [
      _st('Kesish', "Pomidor va mozzarellani doira qilib kesing", 'Нарезать',
          'Нарежьте помидор и моцареллу кружочками'),
      _st('Terish', "Navbatma-navbat terib rayhon va moy bilan bezang", 'Выложить',
          'Выложите поочерёдно и украсьте базиликом и маслом'),
    ],
  );

  static final Recipe koleslo = _r(
    id: 'koleslo',
    uz: 'Koleslo salati',
    ru: 'Салат Коулслоу',
    categoryId: 'salatlar',
    emoji: '🥬',
    bg: const Color(0xFFDFF3E1),
    min: 15,
    kcal: 160,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Oq karam', 'Sabzi', "Mayonez, sirka"],
    ingRu: ['Белокочанная капуста', 'Морковь', 'Майонез, уксус'],
    steps: [
      _st('Maydalash', "Karam va sabzini ingichka to'g'rang", 'Нашинковать',
          'Нашинкуйте капусту и морковь тонкой соломкой'),
      _st('Aralashtirish', "Mayonez va sirka bilan aralashtiring", 'Смешать',
          'Смешайте с майонезом и уксусом'),
    ],
  );

  static final Recipe voldorf = _r(
    id: 'voldorf',
    uz: 'Uoldorf salati',
    ru: 'Салат Вальдорф',
    categoryId: 'salatlar',
    emoji: '🍏',
    bg: const Color(0xFFF9E4EC),
    min: 15,
    kcal: 240,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.3,
    ingUz: ['Olma', "Selderey", "Yong'oq, mayonez"],
    ingRu: ['Яблоко', 'Сельдерей', 'Орехи, майонез'],
    steps: [
      _st('Kesish', "Olma va seldereyni kub qilib to'g'rang", 'Нарезать',
          'Нарежьте яблоко и сельдерей кубиками'),
      _st('Aralashtirish', "Yong'oq va mayonez qo'shib aralashtiring", 'Смешать',
          'Добавьте орехи и майонез, перемешайте'),
    ],
  );

  static final Recipe kobbSalat = _r(
    id: 'kobb_salat',
    uz: 'Kobb salati',
    ru: 'Салат Кобб',
    categoryId: 'salatlar',
    emoji: '🥑',
    bg: const Color(0xFFEAF4E0),
    min: 25,
    kcal: 350,
    servings: 2,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.6,
    ingUz: ["Tovuq", 'Avokado, bekon', 'Tuxum, pomidor'],
    ingRu: ['Курица', 'Авокадо, бекон', 'Яйцо, помидор'],
    steps: [
      _st('Tayyorlash', "Tovuq, bekon va tuxumni alohida pishiring", 'Приготовить',
          'Приготовьте отдельно курицу, бекон и яйца'),
      _st('Qatorlash', "Barcha masalliqlarni tarelkaga qatorlab tering", 'Разложить',
          'Разложите все ингредиенты рядами на тарелке'),
    ],
  );

  static final Recipe tabbule = _r(
    id: 'tabbule',
    uz: 'Tabbule salati',
    ru: 'Салат Табуле',
    categoryId: 'salatlar',
    emoji: '🌿',
    bg: const Color(0xFFE3ECFB),
    min: 20,
    kcal: 150,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Bulgʻur', 'Petrushka', "Pomidor, limon sharbati"],
    ingRu: ['Булгур', 'Петрушка', 'Помидор, лимонный сок'],
    steps: [
      _st('Bulgʻur damlash', "Bulgʻurni issiq suvda 15 daqiqa damlang", 'Запарить булгур',
          'Запарьте булгур в горячей воде 15 минут'),
      _st('Aralashtirish', "Mayda maydalangan petrushka va pomidor bilan aralashtiring",
          'Смешать', 'Смешайте с мелко нарезанной петрушкой и помидором'),
    ],
  );

  static final Recipe fattush = _r(
    id: 'fattush',
    uz: 'Fattush salati',
    ru: 'Салат Фаттуш',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFFFF0D9),
    min: 20,
    kcal: 230,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Qovurilgan non', 'Bodring, pomidor', "Nane, limon sharbati"],
    ingRu: ['Жареный хлеб', 'Огурец, помидор', 'Мята, лимонный сок'],
    steps: [
      _st('Non qovurish', "Nonni bo'lakchalab qarsildoq bo'lguncha qovuring", 'Обжарить хлеб',
          'Нарежьте хлеб кусочками и обжарьте до хруста'),
      _st('Aralashtirish', "Sabzavot va non bo'lakchalarini limon sharbati bilan aralashtiring",
          'Смешать', 'Смешайте овощи и хлеб с лимонным соком'),
    ],
  );

  static final Recipe vinegret = _r(
    id: 'vinegret',
    uz: 'Vinegret salati',
    ru: 'Салат Винегрет',
    categoryId: 'salatlar',
    emoji: '🥕',
    bg: const Color(0xFFF6DEC0),
    min: 40,
    kcal: 190,
    servings: 4,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.3,
    ingUz: ['Lavlagi, sabzi', 'Kartoshka', "Tuzlangan bodring, moy"],
    ingRu: ['Свёкла, морковь', 'Картофель', 'Солёный огурец, масло'],
    steps: [
      _st('Qaynatish', "Lavlagi, sabzi va kartoshkani qaynating", 'Отварить',
          'Отварите свёклу, морковь и картофель'),
      _st('Aralashtirish', "Kub qilib to'g'rab, moy bilan aralashtiring", 'Смешать',
          'Нарежьте кубиками и заправьте маслом'),
    ],
  );

  static final Recipe panzanella = _r(
    id: 'panzanella',
    uz: 'Panzanella salati',
    ru: 'Салат Панзанелла',
    categoryId: 'salatlar',
    emoji: '🍞',
    bg: const Color(0xFFFCE3F0),
    min: 20,
    kcal: 250,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Quruq non', 'Pomidor', "Rayhon, zaytun moyi"],
    ingRu: ['Чёрствый хлеб', 'Помидор', 'Базилик, оливковое масло'],
    steps: [
      _st('Non tayyorlash', "Nonni kubiklab qovuring", 'Подготовить хлеб',
          'Нарежьте хлеб кубиками и обжарьте'),
      _st('Aralashtirish', "Pomidor va rayhon bilan moyga bulab aralashtiring", 'Смешать',
          'Смешайте с помидором и базиликом, заправьте маслом'),
    ],
  );

  static final Recipe vitaminSalat = _r(
    id: 'vitamin_salat',
    uz: 'Vitamin salat (sabzi-karam)',
    ru: 'Витаминный салат (морковь-капуста)',
    categoryId: 'salatlar',
    emoji: '🥕',
    bg: const Color(0xFFDFF3E1),
    min: 10,
    kcal: 110,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.3,
    ingUz: ['Sabzi', 'Oq karam', "Zaytun moyi, limon"],
    ingRu: ['Морковь', 'Белокочанная капуста', 'Оливковое масло, лимон'],
    steps: [
      _st('Maydalash', "Sabzi va karamni ingichka to'g'rang", 'Нашинковать',
          'Нашинкуйте морковь и капусту тонкой соломкой'),
      _st('Aralashtirish', "Moy va limon sharbati bilan aralashtiring", 'Заправить',
          'Заправьте маслом и лимонным соком'),
    ],
  );

  static final Recipe achichuk = _r(
    id: 'achichuk',
    uz: 'Achchiq-chuchuk',
    ru: 'Ачик-чучук',
    categoryId: 'salatlar',
    emoji: '🍅',
    bg: const Color(0xFFFBD9C8),
    min: 10,
    kcal: 90,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.7,
    ingUz: ['Pomidor', 'Piyoz', "Achchiq qalampir, tuz"],
    ingRu: ['Помидор', 'Лук', 'Острый перец, соль'],
    steps: [
      _st('Kesish', "Pomidor va piyozni yupqa halqa qilib kesing", 'Нарезать',
          'Нарежьте помидор и лук тонкими кольцами'),
      _st('Tuzlash', "Tuz sepib, ozgina dam bering", 'Посолить',
          'Посолите и дайте немного настояться'),
    ],
  );

  static final Recipe loviaSalat = _r(
    id: 'lovia_salat',
    uz: 'Loviyali salat',
    ru: 'Фасолевый салат',
    categoryId: 'salatlar',
    emoji: '🫘',
    bg: const Color(0xFFEAF4E0),
    min: 20,
    kcal: 200,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.3,
    ingUz: ['Konserva loviya', "Makkajo'xori", 'Piyoz, mayonez'],
    ingRu: ['Консервированная фасоль', 'Кукуруза', 'Лук, майонез'],
    steps: [
      _st("Suvni to'kish", "Loviya va makkajo'xori suvini to'kib tashlang", 'Слить воду',
          'Слейте воду из фасоли и кукурузы'),
      _st('Aralashtirish', "Piyoz va mayonez bilan aralashtiring", 'Смешать',
          'Смешайте с луком и майонезом'),
    ],
  );

  static final Recipe tunetsSalat = _r(
    id: 'tunets_salat',
    uz: 'Tunets baliqli salat',
    ru: 'Салат с тунцом',
    categoryId: 'salatlar',
    emoji: '🐟',
    bg: const Color(0xFFF9E4EC),
    min: 15,
    kcal: 230,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Konserva tunets', "Tuxum", 'Bodring, mayonez'],
    ingRu: ['Консервированный тунец', 'Яйцо', 'Огурец, майонез'],
    steps: [
      _st('Kesish', "Tuxum va bodringni mayda to'g'rang", 'Нарезать',
          'Нарежьте яйцо и огурец мелко'),
      _st('Aralashtirish', "Tunets bilan aralashtirib mayonez qo'shing", 'Смешать',
          'Смешайте с тунцом и добавьте майонез'),
    ],
  );

  static final Recipe shopskaSalat = _r(
    id: 'shopska_salat',
    uz: 'Shopska salati',
    ru: 'Шопский салат',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFFFF0D9),
    min: 15,
    kcal: 180,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Pomidor, bodring', "Bulg'or qalampiri", "Brindza pishloq"],
    ingRu: ['Помидор, огурец', 'Болгарский перец', 'Сыр брынза'],
    steps: [
      _st('Kesish', "Sabzavotlarni mayda kub qilib to'g'rang", 'Нарезать',
          'Нарежьте овощи мелкими кубиками'),
      _st('Bezash', "Ustidan maydalangan pishloq sepib bezang", 'Оформить',
          'Посыпьте сверху тёртым сыром'),
    ],
  );

  static final Recipe kinoaSalat = _r(
    id: 'kinoa_salat',
    uz: "Kinoa salati",
    ru: 'Салат с киноа',
    categoryId: 'salatlar',
    emoji: '🥗',
    bg: const Color(0xFFE3ECFB),
    min: 25,
    kcal: 260,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Kinoa', "Avokado", 'Pomidor, limon sharbati'],
    ingRu: ['Киноа', 'Авокадо', 'Помидор, лимонный сок'],
    steps: [
      _st('Kinoa qaynatish', "Kinoani suvda 15 daqiqa qaynating", 'Отварить киноа',
          'Отварите киноа в воде 15 минут'),
      _st('Aralashtirish', "Sovutib avokado va pomidor bilan aralashtiring", 'Смешать',
          'Остудите и смешайте с авокадо и помидором'),
    ],
  );

  static final Recipe lavlagiSalat = _r(
    id: 'lavlagi_salat',
    uz: 'Lavlagili salat (yong\'oq bilan)',
    ru: 'Салат из свёклы с орехами',
    categoryId: 'salatlar',
    emoji: '🍠',
    bg: const Color(0xFFFDEBDD),
    min: 45,
    kcal: 210,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.4,
    ingUz: ['Lavlagi', "Yong'oq", 'Sarimsoq, mayonez'],
    ingRu: ['Свёкла', 'Орехи', 'Чеснок, майонез'],
    steps: [
      _st('Qaynatish', "Lavlagini yumshaguncha qaynatib qirib oling", 'Отварить',
          'Отварите свёклу до мягкости и натрите'),
      _st('Aralashtirish', "Yong'oq, sarimsoq va mayonez qo'shing", 'Смешать',
          'Добавьте орехи, чеснок и майонез'),
    ],
  );

  static final Recipe ismaloqSalat = _r(
    id: 'ismaloq_salat',
    uz: 'Ismaloqli salat',
    ru: 'Салат со шпинатом',
    categoryId: 'salatlar',
    emoji: '🥬',
    bg: const Color(0xFFDFF3E1),
    min: 12,
    kcal: 170,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.3,
    ingUz: ['Ismaloq barglari', "Qulupnay", 'Yong\'oq, feta'],
    ingRu: ['Листья шпината', 'Клубника', 'Орехи, фета'],
    steps: [
      _st('Terish', "Ismaloq barglarini idishga tering", 'Выложить',
          'Выложите листья шпината на тарелку'),
      _st('Bezash', "Qulupnay, yong'oq va feta bilan bezang", 'Оформить',
          'Украсьте клубникой, орехами и фетой'),
    ],
  );

  static final Recipe mevaSalat = _r(
    id: 'meva_salat',
    uz: 'Mevali salat',
    ru: 'Фруктовый салат',
    categoryId: 'salatlar',
    emoji: '🍓',
    bg: const Color(0xFFF9E4EC),
    min: 15,
    kcal: 140,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.6,
    ingUz: ['Olma, banan', "Qulupnay", "Uzum, asal"],
    ingRu: ['Яблоко, банан', 'Клубника', 'Виноград, мёд'],
    steps: [
      _st('Kesish', "Mevalarni kub yoki bo'lak qilib to'g'rang", 'Нарезать',
          'Нарежьте фрукты кубиками или дольками'),
      _st('Aralashtirish', "Asal bilan yengil bulab aralashtiring", 'Смешать',
          'Слегка сбрызните мёдом и перемешайте'),
    ],
  );

  static final Recipe makkajoxoriSalat = _r(
    id: 'makkajoxori_salat',
    uz: "Makkajo'xorili salat",
    ru: 'Салат с кукурузой',
    categoryId: 'salatlar',
    emoji: '🌽',
    bg: const Color(0xFFFFF0D9),
    min: 10,
    kcal: 150,
    servings: 2,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.2,
    ingUz: ["Konserva makkajo'xori", 'Krab tayoqchalari', "Mayonez"],
    ingRu: ['Консервированная кукуруза', 'Крабовые палочки', 'Майонез'],
    steps: [
      _st('Kesish', "Krab tayoqchalarini mayda to'g'rang", 'Нарезать',
          'Нарежьте крабовые палочки мелко'),
      _st('Aralashtirish', "Makkajo'xori va mayonez bilan aralashtiring", 'Смешать',
          'Смешайте с кукурузой и майонезом'),
    ],
  );

  static final Recipe krabSalat = _r(
    id: 'krab_salat',
    uz: 'Krab salati',
    ru: 'Крабовый салат',
    categoryId: 'salatlar',
    emoji: '🦀',
    bg: const Color(0xFFE3ECFB),
    min: 15,
    kcal: 220,
    servings: 3,
    diffUz: 'Oson',
    diffRu: 'Легко',
    rating: 4.5,
    ingUz: ['Krab tayoqchalari', "Tuxum, guruch", 'Mayonez'],
    ingRu: ['Крабовые палочки', 'Яйцо, рис', 'Майонез'],
    steps: [
      _st('Qaynatish', "Tuxum va guruchni qaynatib sovuting", 'Отварить',
          'Отварите яйца и рис, остудите'),
      _st('Aralashtirish', "Krab, tuxum, guruchni mayonez bilan aralashtiring", 'Смешать',
          'Смешайте краб, яйцо и рис с майонезом'),
    ],
  );

  static final Recipe seldOdShuboy = _r(
    id: 'seld_pod_shuboy',
    uz: "Mo'yna ostidagi seld",
    ru: 'Селёдка под шубой',
    categoryId: 'salatlar',
    emoji: '🐟',
    bg: const Color(0xFFFBE0DC),
    min: 45,
    kcal: 290,
    servings: 5,
    diffUz: "O'rta",
    diffRu: 'Средне',
    rating: 4.7,
    ingUz: ['Seld baliq', 'Lavlagi, sabzi', "Kartoshka, mayonez"],
    ingRu: ['Сельдь', 'Свёкла, морковь', 'Картофель, майонез'],
    steps: [
      _st('Qaynatish', "Lavlagi, sabzi va kartoshkani alohida qaynating", 'Отварить',
          'Отварите отдельно свёклу, морковь и картофель'),
      _st('Qatlash', "Baliq ustiga sabzavotlarni qatlab mayonez surting", 'Уложить слоями',
          'Уложите слоями овощи поверх рыбы, смазывая майонезом'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    ],
  );

  /// Barcha retseptlar bitta ro'yxatda
  static List<Recipe> get allRecipes => [
<<<<<<< HEAD
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
=======
    // O'zbek
    palov, shashlik, lagmon, manti, palovKokmosh, norin, dimlama, chuchvara, somsa, mastava,
    // Turk
    shawarma, kebab, lahmajun, pide, baklava, iskender, kayseriManti, mercimekShorva, simit, kofte,
    // Yevropa
    pizza, pastaCarbonara, lasagna, pancake, burger, steak, risotto, borsch, croissant, omletFrantsuz,
    // Diabet
    salat, tovuq, shorva, bugdaBaliq, sabzavotliOmlet, qovoqShorva, grechkaKotlet, tovuqSalatDiet,
    sabzavotAralashma, findiqYogurt,
    // Salatlar
    sezarSalat, grekSalat, olivye, kapreze, koleslo, voldorf, kobbSalat, tabbule, fattush, vinegret,
    panzanella, vitaminSalat, achichuk, loviaSalat, tunetsSalat, shopskaSalat, kinoaSalat, lavlagiSalat,
    ismaloqSalat, mevaSalat, makkajoxoriSalat, krabSalat, seldOdShuboy,
  ];

  static List<Recipe> get popularRecipes => [palov, shashlik, kebab, pizza, sezarSalat, iskender];
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830

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