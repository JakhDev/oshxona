import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
<<<<<<< HEAD
import '../data/recipe_repository.dart';
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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

    return Scaffold(
      backgroundColor: AppColors.background,
=======
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                    _circleIcon(Icons.arrow_back, () => Navigator.pop(context)),
                    _circleIcon(
                      appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                          () => appState.toggleSaved(recipe.id),
=======
                    _circleIcon(context, Icons.arrow_back, () => Navigator.pop(context)),
                    _circleIcon(
                      context,
                      appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                      () => appState.toggleSaved(recipe.id),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _tag(categoryTitle, AppColors.primary),
                        const SizedBox(width: 8),
                        _tag('${recipe.durationMin} daq', AppColors.textDark, filled: false),
                        const SizedBox(width: 8),
                        _tag('${recipe.calories} kcal', AppColors.textDark, filled: false),
=======
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: context.colors.textDark)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _tag(context, recipe.difficultyFor(lang), AppColors.primary),
                        const SizedBox(width: 8),
                        _tag(context, '${recipe.durationMin} min', context.colors.textDark, filled: false),
                        const SizedBox(width: 8),
                        _tag(context, '${recipe.calories} kcal', context.colors.textDark, filled: false),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
<<<<<<< HEAD
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
=======
                        _statCard(context, '${recipe.servings}', t('servings_unit'), const Color(0xFFFBE4DA)),
                        const SizedBox(width: 12),
                        _statCard(context, '${recipe.durationMin}', t('minutes_unit'), const Color(0xFFFFF3D6)),
                        const SizedBox(width: 12),
                        _statCard(context, recipe.difficultyFor(lang), t('difficulty_unit'), const Color(0xFFE3F6E6)),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Text(t('ingredients'), style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: context.colors.textDark)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 8,
                      children: recipe
                          .ingredientsFor(lang)
<<<<<<< HEAD
                          .map((ing) => Text('• $ing',
                          style: const TextStyle(color: AppColors.textGrey, fontSize: 14)))
=======
                          .map((ing) => Text('• $ing', style: TextStyle(color: context.colors.textGrey, fontSize: 14)))
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                          .toList(),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
<<<<<<< HEAD
                            MaterialPageRoute(
                                builder: (_) => CookingStepsScreen(recipe: recipe)),
                          );
                        },
                        child: const Text('Tayyorlashni boshlash'),
=======
                            MaterialPageRoute(builder: (_) => CookingStepsScreen(recipe: recipe)),
                          );
                        },
                        child: Text(t('btn_start_cooking')),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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

<<<<<<< HEAD
  Widget _circleIcon(IconData icon, VoidCallback onTap, {Color color = AppColors.textDark}) {
=======
  Widget _circleIcon(BuildContext context, IconData icon, VoidCallback onTap, {Color? color}) {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 19,
<<<<<<< HEAD
        backgroundColor: Colors.white,
        child: Icon(icon, color: color, size: 20),
=======
        backgroundColor: context.colors.card,
        child: Icon(icon, color: color ?? context.colors.textDark, size: 20),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      ),
    );
  }

<<<<<<< HEAD
  Widget _tag(String text, Color color, {bool filled = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: filled ? color : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: filled ? null : Border.all(color: AppColors.divider),
=======
  Widget _tag(BuildContext context, String text, Color color, {bool filled = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: filled ? color : context.colors.card,
        borderRadius: BorderRadius.circular(20),
        border: filled ? null : Border.all(color: context.colors.divider),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      ),
      child: Text(
        text,
        style: TextStyle(
<<<<<<< HEAD
          color: filled ? Colors.white : AppColors.textDark,
=======
          color: filled ? Colors.white : context.colors.textDark,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _statCard(String value, String label, Color color) {
=======
  Widget _statCard(BuildContext context, String value, String label, Color color) {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
<<<<<<< HEAD
            Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
=======
            Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.primaryDark)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF8A7A72))),
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
