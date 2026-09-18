import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

/// 15-ekran: "Tayyorlandi!" — retsept muvaffaqiyatli tugatilgandagi
/// tabriklov ekrani, elastik animatsiya bilan.
class CompletionScreen extends StatefulWidget {
  final Recipe recipe;
  const CompletionScreen({super.key, required this.recipe});

  @override
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  _statBox('${widget.recipe.durationMin}', 'daqiqa', const Color(0xFFFBE4DA)),
                  const SizedBox(width: 12),
                  _statBox('${widget.recipe.steps.length}/${widget.recipe.steps.length}', 'bosqich',
                      const Color(0xFFFFF3D6)),
                  const SizedBox(width: 12),
                  _statBox('${widget.recipe.calories}', 'kcal', const Color(0xFFE3F6E6)),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share, size: 18, color: AppColors.primary),
                      label: const Text('Ulashish', style: TextStyle(color: AppColors.primary)),
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
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 18, color: AppColors.primary),
                      label: const Text('Saqlash', style: TextStyle(color: AppColors.primary)),
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
                  child: const Text('Bosh sahifaga qaytish'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statBox(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
          ],
        ),
      ),
    );
  }
}
