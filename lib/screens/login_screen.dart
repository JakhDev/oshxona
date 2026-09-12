import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'register_screen.dart';
import 'main_screen.dart';

/// 3-ekran: "Kirish" — faqat demo hisob (demo@oshxona.uz / demo123) bilan
/// muvaffaqiyatli bo'ladi, aks holda xatolik ko'rsatiladi.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  void _fillDemo() {
    _emailCtrl.text = DemoAccount.email;
    _passCtrl.text = DemoAccount.password;
  }

  void _login() {
    final appState = context.read<AppState>();
    final ok = appState.login(_emailCtrl.text, _passCtrl.text);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(appState.t('login_error')),
          backgroundColor: AppColors.primaryDark,
        ),
      );
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE0D5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: const Text('🍴', style: TextStyle(fontSize: 30)),
                ),
              ),
              const SizedBox(height: 20),
              Text(t('login_title'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(t('login_subtitle'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.colors.textGrey, fontSize: 14)),
              const SizedBox(height: 28),
              Text(t('email'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'demo@oshxona.uz'),
              ),
              const SizedBox(height: 18),
              Text(t('password'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _passCtrl,
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,
                        color: context.colors.textGrey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _fillDemo,
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 15, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        t('login_demo_hint'),
                        style: const TextStyle(
                            color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              ElevatedButton(onPressed: _login, child: Text(t('btn_login'))),
              const SizedBox(height: 14),
              OutlinedButton.icon(
                onPressed: _login,
                icon: const Text('G',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800)),
                label: Text(t('login_google')),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  side: BorderSide(color: context.colors.divider),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(t('login_no_account'), style: TextStyle(color: context.colors.textGrey)),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    ),
                    child: Text(t('register_link'),
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
