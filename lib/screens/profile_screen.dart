import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../data/recipe_repository.dart';
import '../theme/app_theme.dart';
import 'settings_screen.dart';
import 'login_screen.dart';

/// 13-ekran: "Profil" — foydalanuvchi ma'lumotlari va statistikasi.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const double _headerHeight = 200;
  static const double _statsCardTop = 158;
  static const double _statsCardHeight = 84;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    final topPadding = MediaQuery.of(context).padding.top;
    final headerTotalHeight = _headerHeight + topPadding;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: headerTotalHeight + _statsCardTop + _statsCardHeight - _headerHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: headerTotalHeight,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, topPadding + 16, 20, 0),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.white,
                        child: Text('👨‍🍳', style: TextStyle(fontSize: 30)),
                      ),
                      const SizedBox(height: 10),
                      Text(appState.userName,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 2),
                      Text(appState.userEmail, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
                Positioned(
                  top: topPadding + _statsCardTop,
                  left: 24,
                  right: 24,
                  child: Container(
                    height: _statsCardHeight,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(color: Color(0x14000000), blurRadius: 14, offset: Offset(0, 6)),
                      ],
                    ),
                    child: Row(
                      children: [
                        _stat(RecipeRepository.instance.allRecipes.length.toString(), t('profile_recipes')),
                        _divider(),
                        _stat(appState.savedRecipes.length.toString(), t('profile_saved')),
                        _divider(),
                        _stat(RecipeRepository.instance.categories.length.toString(), t('profile_categories')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: Column(
              children: [
                _menuItem(Icons.person_outline, t('profile_personal_info'), () {}),
                _menuItem(Icons.notifications_none, t('profile_notifications'), () {}),
                _menuItem(Icons.settings_outlined, t('profile_settings'), () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
                }),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () async {
                    await context.read<AppState>().logout();
                    if (!context.mounted) return;
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                          (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBE4DA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: AppColors.primaryDark, size: 18),
                        const SizedBox(width: 8),
                        Text(t('profile_logout'),
                            style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.primary)),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 34, color: AppColors.divider);

  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 8, offset: Offset(0, 3))],
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const SizedBox(width: 14),
              Expanded(
                  child: Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textDark))),
              const Icon(Icons.chevron_right, color: AppColors.textGrey),
            ],
          ),
        ),
      ),
    );
  }
}