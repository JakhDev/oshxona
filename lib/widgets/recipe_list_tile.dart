import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
<<<<<<< HEAD
import '../data/recipe_repository.dart';
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import '../screens/recipe_detail_screen.dart';

/// Gorizontal ro'yxat qatori — Saqlangan, Diabet menyu va Qidiruv natijalarida
<<<<<<< HEAD
/// ishlatiladi.
=======
/// ishlatiladi. Hero tegi RecipeCard bilan bir xil, shu sababli bu yerdan ham
/// retsept rasmiga bosilganda "tap-on-food" o'tish animatsiyasi ishlaydi.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class RecipeListTile extends StatelessWidget {
  final Recipe recipe;
  final bool showHeartOnRight;

  const RecipeListTile({super.key, required this.recipe, this.showHeartOnRight = true});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
<<<<<<< HEAD

    final categoryTitle = RecipeRepository.instance.categories
        .firstWhere(
          (c) => c.id == recipe.categoryId,
      orElse: () => RecipeCategory(
        id: recipe.categoryId,
        title: {'uz': recipe.categoryId, 'ru': recipe.categoryId},
        emoji: '',
        color: AppColors.primary,
        recipeCount: 0,
      ),
    )
        .titleFor(lang);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => RecipeDetailScreen(recipe: recipe)),
=======
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (_, anim, __) => RecipeDetailScreen(recipe: recipe),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
          ),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: Colors.white,
=======
          color: context.colors.card,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Hero(
<<<<<<< HEAD
              tag: 'recipe_list_${recipe.id}',
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: recipe.bgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
=======
              tag: 'recipe_${recipe.id}',
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: recipe.bgColor, borderRadius: BorderRadius.circular(14)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                alignment: Alignment.center,
                child: Text(recipe.emoji, style: const TextStyle(fontSize: 26)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.titleFor(lang),
<<<<<<< HEAD
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(categoryTitle,
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
                      const Text(' • ', style: TextStyle(color: AppColors.textGrey)),
                      Text('${recipe.durationMin} daq',
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
                      if (recipe.glycemicNoteFor(lang) != null) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(recipe.glycemicNoteFor(lang)!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
=======
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: context.colors.textDark)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('${recipe.durationMin} min',
                          style: TextStyle(color: context.colors.textGrey, fontSize: 12)),
                      if (recipe.glycemicNote != null) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(10)),
                          child: Text(recipe.glycemicNoteFor(lang)!,
                              style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            if (showHeartOnRight)
              IconButton(
                onPressed: () => appState.toggleSaved(recipe.id),
                icon: Icon(
                  appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary,
                ),
              )
            else
<<<<<<< HEAD
              const Icon(Icons.chevron_right, color: AppColors.textGrey),
=======
              Icon(Icons.chevron_right, color: context.colors.textGrey),
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
