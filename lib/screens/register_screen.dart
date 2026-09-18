import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

<<<<<<< HEAD
/// 4-ekran: "Ro'yxatdan o'tish" — Supabase Auth orqali haqiqiy hisob yaratadi.
=======
/// 4-ekran: "Ro'yxatdan o'tish" — MVP: yangi hisob "yaratiladi", lekin
/// tizimda faqat demo hisob (demo@oshxona.uz / demo123) haqiqiy ekanligi
/// sababli, muvaffaqiyatli ro'yxatdan o'tgach foydalanuvchi shu ma'lumotlar
/// bilan Kirish ekraniga yo'naltiriladi.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _agree = true;
<<<<<<< HEAD
  bool _loading = false;
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.primaryDark),
    );
  }

<<<<<<< HEAD
  Future<void> _register() async {
=======
  void _register() {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    final appState = context.read<AppState>();
    if (_nameCtrl.text.trim().isEmpty ||
        _emailCtrl.text.trim().isEmpty ||
        _passCtrl.text.isEmpty ||
        _confirmCtrl.text.isEmpty) {
      _showError(appState.t('register_error_empty'));
      return;
    }
    if (!_agree) {
      _showError(appState.t('register_error_agree'));
      return;
    }
    if (_passCtrl.text != _confirmCtrl.text) {
      _showError(appState.t('register_error_match'));
      return;
    }

<<<<<<< HEAD
    setState(() => _loading = true);
    final error = await appState.register(_nameCtrl.text, _emailCtrl.text, _passCtrl.text);
    if (!mounted) return;
    setState(() => _loading = false);

    if (error != null) {
      _showError(error);
      return;
    }

=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(appState.t('register_success')), backgroundColor: AppColors.green),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.textDark),
=======
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: BackButton(color: context.colors.textDark),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        title: Text(t('register_title'), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Text(t('name'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(controller: _nameCtrl, decoration: InputDecoration(hintText: t('name_hint'))),
              const SizedBox(height: 16),
              Text(t('email'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(controller: _emailCtrl, decoration: const InputDecoration(hintText: 'email@gmail.com')),
              const SizedBox(height: 16),
              Text(t('password'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _passCtrl,
                obscureText: true,
                decoration: InputDecoration(hintText: t('password_create_hint')),
              ),
              const SizedBox(height: 16),
              Text(t('confirm_password'), style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: _confirmCtrl,
                obscureText: true,
                decoration: InputDecoration(hintText: t('confirm_password_hint')),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _agree,
                    activeColor: AppColors.primary,
                    onChanged: (v) => setState(() => _agree = v ?? true),
                  ),
                  Expanded(
                    child: Text(t('agree_terms'),
<<<<<<< HEAD
                        style: const TextStyle(fontSize: 13, color: AppColors.textGrey)),
=======
                        style: TextStyle(fontSize: 13, color: context.colors.textGrey)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  ),
                ],
              ),
              const SizedBox(height: 12),
<<<<<<< HEAD
              ElevatedButton(
                onPressed: _loading ? null : _register,
                child: _loading
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
                    : Text(t('btn_create_account')),
              ),
=======
              ElevatedButton(onPressed: _register, child: Text(t('btn_create_account'))),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
