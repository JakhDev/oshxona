import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

/// 4-ekran: "Ro'yxatdan o'tish" — MVP: yangi hisob "yaratiladi", lekin
/// tizimda faqat demo hisob (demo@oshxona.uz / demo123) haqiqiy ekanligi
/// sababli, muvaffaqiyatli ro'yxatdan o'tgach foydalanuvchi shu ma'lumotlar
/// bilan Kirish ekraniga yo'naltiriladi.
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

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.primaryDark),
    );
  }

  void _register() {
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
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: BackButton(color: context.colors.textDark),
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
                        style: TextStyle(fontSize: 13, color: context.colors.textGrey)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _register, child: Text(t('btn_create_account'))),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
