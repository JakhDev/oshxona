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
import '../widgets/recipe_card.dart';

<<<<<<< HEAD
/// 7-ekran: Tanlangan kategoriyadagi barcha retseptlar.
=======
/// 7-ekran: Tanlangan kategoriyadagi barcha retseptlar (masalan "O'zbek taomlar").
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class CategoryDetailScreen extends StatelessWidget {
  final RecipeCategory category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
    final t = appState.t;
<<<<<<< HEAD
    final recipes = RecipeRepository.instance.byCategory(category.id);
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.background,
=======
    final recipes = MockData.byCategory(category.id);
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, topPadding + 10, 20, 24),
              decoration: BoxDecoration(
                color: category.color,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 17,
<<<<<<< HEAD
                      backgroundColor: Colors.white.withOpacity(0.24),
=======
                      backgroundColor: context.colors.headerOverlay,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(category.titleFor(lang),
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text('${recipes.length} ${t('recipe_count_suffix')}',
                      style: const TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.78,
              ),
              delegate: SliverChildBuilderDelegate(
<<<<<<< HEAD
                    (context, i) => RecipeCard(recipe: recipes[i]),
=======
                (context, i) => RecipeCard(recipe: recipes[i]),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                childCount: recipes.length,
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
