import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/mock_data.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'search_screen.dart';
import '../widgets/recipe_card.dart';

/// 5-ekran: "Bosh" — asosiy ekran, mashhur retseptlar va filtr chiplar bilan.
/// Eslatma: header konteyner status-bar ortiga qadar cho'ziladi (to'liq
/// ekranni egallaydi, tepada bo'sh joy qolmaydi).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filter = 'all';
  final _filterIds = const ['all', 'ozbek', 'turk', 'yevropa'];

  List<Recipe> get _filteredRecipes {
    if (_filter == 'all') return MockData.popularRecipes;
    return MockData.allRecipes.where((r) => r.categoryId == _filter).toList();
  }

  String _filterLabel(String id, String Function(String) t, String lang) {
    if (id == 'all') return t('filter_all');
    final cat = MockData.categories.firstWhere((c) => c.id == id);
    return cat.titleFor(lang).split(' ').first; // qisqa nom chip uchun
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    final lang = appState.languageCode;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.colors.background,
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
                        backgroundColor: Colors.white.withOpacity(0.2),
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
                        color: Colors.white.withOpacity(0.18),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 52,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                scrollDirection: Axis.horizontal,
                itemCount: _filterIds.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final id = _filterIds[i];
                  final selected = id == _filter;
                  return GestureDetector(
                    onTap: () => setState(() => _filter = id),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : context.colors.card,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: selected ? AppColors.primary : context.colors.divider),
                      ),
                      child: Text(
                        _filterLabel(id, t, lang),
                        style: TextStyle(
                          color: selected ? Colors.white : context.colors.textDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            sliver: SliverToBoxAdapter(
              child: Text(t('popular_recipes'),
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w800, color: context.colors.textDark)),
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
}
