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
import 'home_screen.dart' show openCategory;

/// 6-ekran: "Kategoriyalar" — barcha taom turkumlari ro'yxati.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final topPadding = MediaQuery.of(context).padding.top;
<<<<<<< HEAD
    final categories = RecipeRepository.instance.categories;
    return Scaffold(
      backgroundColor: AppColors.background,
=======
    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, topPadding + 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appState.t('categories_title'),
<<<<<<< HEAD
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.textDark)),
=======
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 100),
<<<<<<< HEAD
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final cat = categories[i];
=======
                itemCount: MockData.categories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final cat = MockData.categories[i];
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  return _CategoryTile(category: cat, highlighted: cat.id == 'diabet');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final RecipeCategory category;
  final bool highlighted;

  const _CategoryTile({required this.category, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
    final t = appState.t;
    return GestureDetector(
      onTap: () => openCategory(context, category),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: highlighted ? const Color(0xFFE3F6E6) : AppColors.card,
=======
          color: highlighted ? const Color(0xFFE3F6E6) : context.colors.card,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          borderRadius: BorderRadius.circular(18),
          border: highlighted ? Border.all(color: AppColors.green, width: 1.4) : null,
          boxShadow: const [
            BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(color: category.color, borderRadius: BorderRadius.circular(14)),
              alignment: Alignment.center,
              child: Text(category.emoji, style: const TextStyle(fontSize: 24)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.titleFor(lang),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
<<<<<<< HEAD
                          color: highlighted ? AppColors.primaryDark : AppColors.textDark)),
=======
                          color: highlighted ? AppColors.primaryDark : context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  const SizedBox(height: 3),
                  Text(
                    '${category.recipeCount} ${highlighted ? t('recipe_count_special_suffix') : t('recipe_count_suffix')}',
                    style: TextStyle(
                      color: highlighted ? AppColors.green : AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            Icon(Icons.chevron_right, color: highlighted ? AppColors.green : AppColors.textGrey),
=======
            Icon(Icons.chevron_right, color: highlighted ? AppColors.green : context.colors.textGrey),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
