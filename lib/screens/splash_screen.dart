import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'onboarding_screen.dart';

/// 1-ekran: Splash — logotip ko'rsatiladi, so'ng avtomatik Onboarding'ga o'tadi.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.read<AppState>().t;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: const Text('🍴', style: TextStyle(fontSize: 44)),
            ),
            const SizedBox(height: 24),
            Text(
              t('app_name'),
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              t('app_tagline'),
              style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
