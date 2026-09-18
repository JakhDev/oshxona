import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
<<<<<<< HEAD
import '../data/recipe_repository.dart';
import '../theme/app_theme.dart';
import 'onboarding_screen.dart';
import 'main_screen.dart';

/// 1-ekran: Splash — brendlangan grafik dizayn, so'ng sessiya holatiga
/// qarab Onboarding yoki asosiy ekranga o'tadi.
=======
import '../theme/app_theme.dart';
import 'onboarding_screen.dart';

/// 1-ekran: Splash — brendlangan grafik dizayn bilan, so'ng avtomatik
/// Onboarding'ga o'tadi.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _logoScale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _fade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    );
    _controller.forward();

<<<<<<< HEAD
    Future.delayed(const Duration(milliseconds: 2000), () async {
      if (!mounted) return;
      final appState = context.read<AppState>();

      await RecipeRepository.instance.load();

      if (appState.isLoggedIn) {
        await appState.loadFavorites();
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        if (!mounted) return;
=======
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.read<AppState>().t;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: Stack(
          children: [
<<<<<<< HEAD
=======
            // Orqa fondagi dekorativ doiralar
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            Positioned(
              top: -size.width * 0.35,
              right: -size.width * 0.3,
              child: _softCircle(size.width * 0.8, Colors.white.withValues(alpha: 0.07)),
            ),
            Positioned(
              bottom: -size.width * 0.4,
              left: -size.width * 0.35,
              child: _softCircle(size.width * 0.9, Colors.white.withValues(alpha: 0.06)),
            ),
            Positioned(
              top: size.height * 0.14,
              left: size.width * 0.12,
              child: _floatingBadge('🍲'),
            ),
            Positioned(
              top: size.height * 0.22,
              right: size.width * 0.14,
              child: _floatingBadge('🥗'),
            ),
            Positioned(
              bottom: size.height * 0.28,
              right: size.width * 0.1,
              child: _floatingBadge('🍜'),
            ),
            Positioned(
              bottom: size.height * 0.2,
              left: size.width * 0.1,
              child: _floatingBadge('🥙'),
            ),
<<<<<<< HEAD
=======
            // Markaziy logotip va matn
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _logoScale,
                    child: Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.18),
                            blurRadius: 28,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('🍴', style: TextStyle(fontSize: 52)),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FadeTransition(
                    opacity: _fade,
                    child: Column(
                      children: [
                        Text(
                          t('app_name'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t('app_tagline'),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
=======
            // Pastdagi yuklanish indikatori
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            Positioned(
              left: 0,
              right: 0,
              bottom: 56,
              child: FadeTransition(
                opacity: _fade,
                child: Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation(Colors.white.withValues(alpha: 0.85)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _softCircle(double d, Color color) {
    return Container(width: d, height: d, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }

  Widget _floatingBadge(String emoji) {
    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(
        scale: _logoScale,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
          ),
          alignment: Alignment.center,
          child: Text(emoji, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
