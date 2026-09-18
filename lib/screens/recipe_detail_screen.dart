import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/recipe_repository.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'cooking_steps_screen.dart';

/// 8-ekran: "Retsept tafsiloti" — ingredientlar va boshlash tugmasi bilan.
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;

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

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(Icons.arrow_back, () => Navigator.pop(context)),
                    _circleIcon(
                      appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                          () => appState.toggleSaved(recipe.id),
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Center(
                child: Hero(
                  tag: 'recipe_${recipe.id}',
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(color: recipe.bgColor, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(recipe.emoji, style: const TextStyle(fontSize: 56)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.titleFor(lang),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _tag(categoryTitle, AppColors.primary),
                        const SizedBox(width: 8),
                        _tag('${recipe.durationMin} daq', AppColors.textDark, filled: false),
                        const SizedBox(width: 8),
                        _tag('${recipe.calories} kcal', AppColors.textDark, filled: false),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _statCard('${recipe.servings}', 'kishi', const Color(0xFFFBE4DA)),
                        const SizedBox(width: 12),
                        _statCard('${recipe.durationMin}', 'daqiqa', const Color(0xFFFFF3D6)),
                        const SizedBox(width: 12),
                        _statCard(recipe.difficultyFor(lang), 'daraja', const Color(0xFFE3F6E6)),
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Text('Ingredientlar',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 8,
                      children: recipe
                          .ingredientsFor(lang)
                          .map((ing) => Text('• $ing',
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 14)))
                          .toList(),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => CookingStepsScreen(recipe: recipe)),
                          );
                        },
                        child: const Text('Tayyorlashni boshlash'),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback onTap, {Color color = AppColors.textDark}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 19,
        backgroundColor: Colors.white,
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _tag(String text, Color color, {bool filled = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: filled ? color : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: filled ? null : Border.all(color: AppColors.divider),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: filled ? Colors.white : AppColors.textDark,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _statCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
          ],
        ),
      ),
    );
  }
}