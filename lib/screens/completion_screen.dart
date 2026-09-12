import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

/// 15-ekran: "Tayyorlandi!" — retsept muvaffaqiyatli tugatilgandagi
/// tabriklov ekrani.
class CompletionScreen extends StatelessWidget {
  final Recipe recipe;
  const CompletionScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(color: Color(0xFFFCE0D5), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: const Text('🎉', style: TextStyle(fontSize: 52)),
              ),
              const SizedBox(height: 26),
              Text(t('completion_title'),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: context.colors.textDark)),
              const SizedBox(height: 8),
              Text(
                recipe.titleFor(lang),
                textAlign: TextAlign.center,
                style: TextStyle(color: context.colors.textGrey, fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  _statBox(context, '${recipe.durationMin}', t('minutes_unit'), const Color(0xFFFBE4DA)),
                  const SizedBox(width: 12),
                  _statBox(context, '${recipe.steps.length}/${recipe.steps.length}', t('step_of'),
                      const Color(0xFFFFF3D6)),
                  const SizedBox(width: 12),
                  _statBox(context, '${recipe.calories}', t('completion_calories'), const Color(0xFFE3F6E6)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share, size: 18, color: AppColors.primary),
                      label: Text(t('btn_share'), style: const TextStyle(color: AppColors.primary)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => appState.toggleSaved(recipe.id),
                      icon: Icon(
                        appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      label: Text(t('btn_save'), style: const TextStyle(color: AppColors.primary)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  child: Text(t('btn_back_home')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statBox(BuildContext context, String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primaryDark)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF8A7A72))),
          ],
        ),
      ),
    );
  }
}
