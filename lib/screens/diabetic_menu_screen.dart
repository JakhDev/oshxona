import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/recipe_repository.dart';
import '../theme/app_theme.dart';
import '../widgets/recipe_list_tile.dart';

/// 10-ekran: "Diabet menyu" — past glisemik indeksli taomlar ro'yxati.
class DiabeticMenuScreen extends StatelessWidget {
  const DiabeticMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    final recipes = RecipeRepository.instance.byCategory('diabet');
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, topPadding + 10, 20, 22),
            decoration: const BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white.withOpacity(0.24),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(height: 14),
                Text(t('diabetic_title'),
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(t('diabetic_subtitle'), style: const TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              itemCount: recipes.length,
              itemBuilder: (context, i) => RecipeListTile(recipe: recipes[i]),
            ),
          ),
        ],
      ),
    );
  }
}