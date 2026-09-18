import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import '../screens/recipe_detail_screen.dart';

/// Katta (grid) retsept kartochkasi — Home va Kategoriya ekranlarida ishlatiladi.
class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool showFavorite;

  const RecipeCard({super.key, required this.recipe, this.showFavorite = false});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (_, anim, __) => RecipeDetailScreen(recipe: recipe),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: Tween(begin: const Offset(0, 0.05), end: Offset.zero)
                    .animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
                child: child,
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Color(0x0F000000), blurRadius: 12, offset: Offset(0, 6)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'recipe_${recipe.id}',
                  child: Container(
                    height: 96,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: recipe.bgColor,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                    ),
                    alignment: Alignment.center,
                    child: Text(recipe.emoji, style: const TextStyle(fontSize: 40)),
                  ),
                ),
                if (recipe.glycemicNoteFor(lang) != null)
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: _badge(recipe.glycemicNoteFor(lang)!, AppColors.green),
                  )
                else
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: _badge(
                      recipe.categoryId,
                      recipe.categoryId == 'turk' ? AppColors.yellow : AppColors.primary,
                    ),
                  ),
                if (showFavorite)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: GestureDetector(
                      onTap: () => appState.toggleSaved(recipe.id),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        child: Icon(
                          appState.isSaved(recipe.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.titleFor(lang),
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 13, color: AppColors.textGrey),
                      const SizedBox(width: 4),
                      Text('${recipe.durationMin} daq',
                          style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                      const SizedBox(width: 10),
                      const Icon(Icons.star_rounded, size: 14, color: AppColors.star),
                      const SizedBox(width: 2),
                      Text('${recipe.rating}',
                          style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
      ),
    );
  }
}