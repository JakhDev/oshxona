import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/mock_data.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import '../widgets/recipe_list_tile.dart';

/// 12-ekran: "Qidiruv" — retseptlarni nomi bo'yicha izlash.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _ctrl = TextEditingController();
  List<Recipe> _results = [];

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onChanged);
  }

  void _onChanged() {
    final lang = context.read<AppState>().languageCode;
    setState(() => _results = MockData.search(_ctrl.text, lang));
  }

  @override
  void dispose() {
    _ctrl.removeListener(_onChanged);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: context.colors.textDark),
                  ),
                  const SizedBox(width: 12),
                  Text(t('search_title'),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: context.colors.textDark)),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _ctrl,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                  hintText: t('search_hint'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              if (_ctrl.text.isNotEmpty)
                Text('${_results.length} ${t('search_results_found')}',
                    style: TextStyle(color: context.colors.textGrey, fontSize: 13)),
              const SizedBox(height: 12),
              Expanded(
                child: _ctrl.text.isEmpty
                    ? const SizedBox.shrink()
                    : _results.isEmpty
                        ? Center(child: Text(t('search_no_results'), style: TextStyle(color: context.colors.textGrey)))
                        : ListView.builder(
                            itemCount: _results.length,
                            itemBuilder: (context, i) => RecipeListTile(recipe: _results[i], showHeartOnRight: false),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
