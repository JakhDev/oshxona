import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
<<<<<<< HEAD
import '../data/recipe_repository.dart';
=======
import '../data/mock_data.dart';
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'search_screen.dart';
import 'categories_screen.dart';
import 'category_detail_screen.dart';
import 'diabetic_menu_screen.dart';
import 'salads_screen.dart';
import '../widgets/recipe_card.dart';

<<<<<<< HEAD
=======
/// Kategoriya bosilganda mos ekranga o'tish — Home, Kategoriyalar
/// ekranlarida ishlatiladigan umumiy navigatsiya qoidasi.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
void openCategory(BuildContext context, RecipeCategory category) {
  Widget screen;
  if (category.id == 'diabet') {
    screen = const DiabeticMenuScreen();
  } else if (category.id == 'salatlar') {
    screen = const SaladsScreen();
  } else {
    screen = CategoryDetailScreen(category: category);
  }
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

<<<<<<< HEAD
/// 5-ekran: "Bosh" — asosiy ekran, mashhur retseptlar va kategoriyalar bilan.
=======
/// 5-ekran: "Bosh" — asosiy ekran, mashhur retseptlar va filtr chiplar bilan.
/// Eslatma: header konteyner status-bar ortiga qadar cho'ziladi (to'liq
/// ekranni egallaydi, tepada bo'sh joy qolmaydi).
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD
  List<Recipe> get _filteredRecipes => RecipeRepository.instance.popularRecipes;
=======
  List<Recipe> get _filteredRecipes => MockData.popularRecipes;
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    final lang = appState.languageCode;
    final topPadding = MediaQuery.of(context).padding.top;
<<<<<<< HEAD
    final categories = RecipeRepository.instance.categories;

    return Scaffold(
      backgroundColor: AppColors.background,
=======

    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, topPadding + 14, 20, 22),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t('greeting_morning'),
                                style: const TextStyle(color: Colors.white70, fontSize: 14)),
                            Text(appState.userName.split(' ').first,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 19,
<<<<<<< HEAD
                        backgroundColor: Colors.white.withOpacity(0.2),
=======
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                        child: const Icon(Icons.notifications_none, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const SearchScreen())),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
<<<<<<< HEAD
                        color: Colors.white.withOpacity(0.18),
=======
                        color: Colors.white.withValues(alpha: 0.18),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.white70),
                          const SizedBox(width: 10),
                          Text(t('search_hint'), style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t('categories_title'),
<<<<<<< HEAD
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textDark)),
=======
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800, color: context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const CategoriesScreen())),
                    child: Text(t('see_all'),
                        style: const TextStyle(
                            color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 96,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
                scrollDirection: Axis.horizontal,
<<<<<<< HEAD
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final cat = categories[i];
=======
                itemCount: MockData.categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final cat = MockData.categories[i];
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  return GestureDetector(
                    onTap: () => openCategory(context, cat),
                    child: SizedBox(
                      width: 76,
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(color: cat.color, borderRadius: BorderRadius.circular(18)),
                            alignment: Alignment.center,
                            child: Text(cat.emoji, style: const TextStyle(fontSize: 26)),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cat.titleFor(lang).split(' ').first,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
<<<<<<< HEAD
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
=======
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.colors.textDark,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            sliver: SliverToBoxAdapter(
              child: Text(t('popular_recipes'),
<<<<<<< HEAD
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.textDark)),
=======
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w800, color: context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.78,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, i) => RecipeCard(recipe: _filteredRecipes[i]),
                childCount: _filteredRecipes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
