import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:provider/provider.dart';
import '../data/app_state.dart';
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

/// 15-ekran: "Tayyorlandi!" — retsept muvaffaqiyatli tugatilgandagi
<<<<<<< HEAD
/// tabriklov ekrani, elastik animatsiya bilan.
class CompletionScreen extends StatefulWidget {
=======
/// tabriklov ekrani.
class CompletionScreen extends StatelessWidget {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  final Recipe recipe;
  const CompletionScreen({super.key, required this.recipe});

  @override
<<<<<<< HEAD
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
=======
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final lang = appState.languageCode;
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
<<<<<<< HEAD
              ScaleTransition(
                scale: CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(color: Color(0xFFFCE0D5), shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: const Text('🎉', style: TextStyle(fontSize: 52)),
                ),
              ),
              const SizedBox(height: 26),
              const Text('Tayyorlandi!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(
                '${widget.recipe.title} muvaffaqiyatli tayyorlandi.\nOilangizga sahoyi nafi tegsin!',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.4),
=======
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
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              ),
              const SizedBox(height: 28),
              Row(
                children: [
<<<<<<< HEAD
                  _statBox('${widget.recipe.durationMin}', 'daqiqa', const Color(0xFFFBE4DA)),
                  const SizedBox(width: 12),
                  _statBox('${widget.recipe.steps.length}/${widget.recipe.steps.length}', 'bosqich',
                      const Color(0xFFFFF3D6)),
                  const SizedBox(width: 12),
                  _statBox('${widget.recipe.calories}', 'kcal', const Color(0xFFE3F6E6)),
=======
                  _statBox(context, '${recipe.durationMin}', t('minutes_unit'), const Color(0xFFFBE4DA)),
                  const SizedBox(width: 12),
                  _statBox(context, '${recipe.steps.length}/${recipe.steps.length}', t('step_of'),
                      const Color(0xFFFFF3D6)),
                  const SizedBox(width: 12),
                  _statBox(context, '${recipe.calories}', t('completion_calories'), const Color(0xFFE3F6E6)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share, size: 18, color: AppColors.primary),
<<<<<<< HEAD
                      label: const Text('Ulashish', style: TextStyle(color: AppColors.primary)),
=======
                      label: Text(t('btn_share'), style: const TextStyle(color: AppColors.primary)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 18, color: AppColors.primary),
                      label: const Text('Saqlash', style: TextStyle(color: AppColors.primary)),
=======
                      onPressed: () => appState.toggleSaved(recipe.id),
                      icon: Icon(
                        appState.isSaved(recipe.id) ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      label: Text(t('btn_save'), style: const TextStyle(color: AppColors.primary)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                  child: const Text('Bosh sahifaga qaytish'),
=======
                  child: Text(t('btn_back_home')),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _statBox(String value, String label, Color color) {
=======
  Widget _statBox(BuildContext context, String value, String label, Color color) {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
<<<<<<< HEAD
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
=======
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primaryDark)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF8A7A72))),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          ],
        ),
      ),
    );
  }
}
