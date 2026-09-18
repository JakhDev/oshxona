import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:provider/provider.dart';
import '../data/app_state.dart';
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import '../theme/app_theme.dart';
import 'login_screen.dart';

class _OnboardItem {
  final String emoji;
<<<<<<< HEAD
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
=======
  final Color bgLight;
  final String titleKey;
  final String subKey;
  const _OnboardItem(this.emoji, this.bgLight, this.titleKey, this.subKey);
}

/// 2-ekran: "Xush kelibsiz!" — ilova imkoniyatlari haqida qisqacha tanishtiruv.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const _items = [
    _OnboardItem('🍽️', Color(0xFFFBE4DA), 'onboard_item1_title', 'onboard_item1_sub'),
    _OnboardItem('💚', Color(0xFFE3F6E6), 'onboard_item2_title', 'onboard_item2_sub'),
    _OnboardItem('👨‍🍳', Color(0xFFFFF3D6), 'onboard_item3_title', 'onboard_item3_sub'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  ];

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.background,
=======
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<< HEAD
              const Text(
                'Xush kelibsiz!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                'Eng mazali retseptlar sizni kutmoqda',
                style: TextStyle(color: AppColors.textGrey, fontSize: 14),
              ),
=======
              Text(t('onboard_welcome'),
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text(t('onboard_subtitle'),
                  style: TextStyle(color: context.colors.textGrey, fontSize: 14)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              const SizedBox(height: 28),
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    final item = _items[i];
<<<<<<< HEAD
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
=======
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: item.bgLight,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Text(item.emoji, style: const TextStyle(fontSize: 30)),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t(item.titleKey),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: AppColors.primaryDark)),
                              const SizedBox(height: 2),
                              Text(t(item.subKey),
                                  style: const TextStyle(color: AppColors.primary, fontSize: 13)),
                            ],
                          ),
                        ],
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                child: const Text('Boshlash'),
=======
                child: Text(t('btn_start')),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              ),
            ],
          ),
        ),
      ),
    );
  }
}
