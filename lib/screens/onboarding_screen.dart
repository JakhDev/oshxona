import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class _OnboardItem {
  final String emoji;
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
  ];

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t('onboard_welcome'),
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text(t('onboard_subtitle'),
                  style: TextStyle(color: context.colors.textGrey, fontSize: 14)),
              const SizedBox(height: 28),
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    final item = _items[i];
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
                child: Text(t('btn_start')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
