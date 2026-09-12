import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/mock_data.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'category_detail_screen.dart';
import 'diabetic_menu_screen.dart';

/// 6-ekran: "Kategoriyalar" — barcha taom turkumlari ro'yxati.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, topPadding + 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appState.t('categories_title'),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: context.colors.textDark)),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: MockData.categories.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final cat = MockData.categories[i];
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              category.id == 'diabet' ? const DiabeticMenuScreen() : CategoryDetailScreen(category: category),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: highlighted ? const Color(0xFFE3F6E6) : context.colors.card,
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
                          color: highlighted ? AppColors.primaryDark : context.colors.textDark)),
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
            Icon(Icons.chevron_right, color: highlighted ? AppColors.green : context.colors.textGrey),
          ],
        ),
      ),
    );
  }
}
