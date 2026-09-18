import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class _OnboardItem {
  final String emoji;
  final Color bg;
  final String title;
  final String subtitle;
  const _OnboardItem(this.emoji, this.bg, this.title, this.subtitle);
}

/// 2-ekran: "Xush kelibsiz!" — ilova imkoniyatlari haqida qisqacha tanishtiruv.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _items = const [
    _OnboardItem('🍽️', Color(0xFFFBE4DA), '100+ retsept', 'Har kuni yangilanib turadi'),
    _OnboardItem('💚', Color(0xFFE3F6E6), 'Diabet menyu', "Sog'lom va mazali"),
    _OnboardItem('👨‍🍳', Color(0xFFFFF3D6), 'Bosqichma-bosqich', 'Oson va tushunarli'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Xush kelibsiz!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                'Eng mazali retseptlar sizni kutmoqda',
                style: TextStyle(color: AppColors.textGrey, fontSize: 14),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    final item = _items[i];
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 400 + i * 150),
                      curve: Curves.easeOut,
                      builder: (context, value, child) => Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(30 * (1 - value), 0),
                          child: child,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: item.bg,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Text(item.emoji, style: const TextStyle(fontSize: 30)),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 15)),
                                const SizedBox(height: 2),
                                Text(item.subtitle,
                                    style: const TextStyle(
                                        color: AppColors.primary, fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text('Boshlash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
