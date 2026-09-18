import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/recipe_list_tile.dart';

/// 11-ekran: "Saqlangan" — foydalanuvchi sevimli qilib belgilagan retseptlar.
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
<<<<<<< HEAD
    final saved = appState.savedRecipes;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Saqlangan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            const SizedBox(height: 18),
            Expanded(
              child: saved.isEmpty
                  ? _EmptyState()
                  : ListView.builder(
=======
    final t = appState.t;
    final saved = appState.savedRecipes;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, topPadding + 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t('saved_title'), style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: context.colors.textDark)),
            const SizedBox(height: 18),
            Expanded(
              child: saved.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_border, size: 56, color: context.colors.textGrey),
                          const SizedBox(height: 14),
                          Text(t('saved_empty'), style: TextStyle(color: context.colors.textGrey, fontSize: 14)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      itemCount: saved.length,
                      itemBuilder: (context, i) => RecipeListTile(recipe: saved[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
<<<<<<< HEAD

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border, size: 56, color: AppColors.textGrey),
          SizedBox(height: 14),
          Text("Hozircha saqlangan retsept yo'q",
              style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
        ],
      ),
    );
  }
}
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
