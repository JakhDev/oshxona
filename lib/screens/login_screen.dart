import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'register_screen.dart';
import 'main_screen.dart';

<<<<<<< HEAD
/// 3-ekran: "Kirish" — Supabase Auth orqali.
=======
/// 3-ekran: "Kirish" — faqat demo hisob (demo@oshxona.uz / demo123) bilan
/// muvaffaqiyatli bo'ladi, aks holda xatolik ko'rsatiladi.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
<<<<<<< HEAD
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    final appState = context.read<AppState>();
    final error = await appState.login(_emailCtrl.text, _passCtrl.text);
    if (!mounted) return;
    setState(() => _loading = false);

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: AppColors.primaryDark),
=======

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
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      );
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainScreen()),
<<<<<<< HEAD
          (route) => false,
=======
      (route) => false,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
      backgroundColor: AppColors.background,
=======
      backgroundColor: context.colors.background,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 14)),
=======
                  style: TextStyle(color: context.colors.textGrey, fontSize: 14)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              const SizedBox(height: 28),
              Text(t('email'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
<<<<<<< HEAD
                decoration: const InputDecoration(hintText: 'email@gmail.com'),
=======
                decoration: const InputDecoration(hintText: 'demo@oshxona.uz'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
                        color: AppColors.textGrey),
=======
                        color: context.colors.textGrey),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: _loading ? null : _login,
                child: _loading
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
                    : Text(t('btn_login')),
=======
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
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
<<<<<<< HEAD
                  Text(t('login_no_account'), style: const TextStyle(color: AppColors.textGrey)),
=======
                  Text(t('login_no_account'), style: TextStyle(color: context.colors.textGrey)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
