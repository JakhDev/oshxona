import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';

<<<<<<< HEAD
/// 14-ekran: "Sozlamalar" — til, tungi rejim, bildirishnomalar.
=======
/// 14-ekran: "Sozlamalar" — til, kunduzgi/kechki tema, bildirishnomalar.
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.textDark),
        title: const Text('Sozlamalar', style: TextStyle(fontWeight: FontWeight.w800)),
=======
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: BackButton(color: context.colors.textDark),
        title: Text(t('settings_title'), style: const TextStyle(fontWeight: FontWeight.w800)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<< HEAD
              const Text('TIL', style: TextStyle(color: AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(child: _langChip(appState, "O'zbek", 'uz')),
                    Expanded(child: _langChip(appState, 'Русский', 'ru')),
=======
              Text(t('settings_language'),
                  style: TextStyle(color: context.colors.textGrey, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: context.colors.card, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(child: _langChip(context, 'uz', "O'zbek", appState)),
                    Expanded(child: _langChip(context, 'ru', 'Русский', appState)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                  ],
                ),
              ),
              const SizedBox(height: 22),
              _switchTile(
<<<<<<< HEAD
                icon: Icons.dark_mode_outlined,
                title: "Qorong'u rejim",
                subtitle: 'Tungi ko\'rinish',
=======
                context,
                icon: Icons.dark_mode_outlined,
                title: t('settings_dark_mode'),
                subtitle: t('settings_dark_mode_sub'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                value: appState.darkMode,
                onChanged: appState.setDarkMode,
              ),
              const SizedBox(height: 12),
              _switchTile(
<<<<<<< HEAD
                icon: Icons.notifications_none,
                title: 'Bildirishnomalar',
                subtitle: 'Yangi retseptlar',
=======
                context,
                icon: Icons.notifications_none,
                title: t('profile_notifications'),
                subtitle: t('settings_notifications_sub'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                value: appState.notificationsEnabled,
                onChanged: appState.setNotifications,
              ),
              const SizedBox(height: 22),
<<<<<<< HEAD
              _linkTile(Icons.info_outline, 'Dastur haqida'),
              const SizedBox(height: 12),
              _linkTile(Icons.star_border, 'Baholash'),
=======
              _linkTile(context, Icons.info_outline, t('settings_about')),
              const SizedBox(height: 12),
              _linkTile(context, Icons.star_border, t('settings_rate')),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
            ],
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _langChip(AppState appState, String label, String code) {
    final selected = appState.languageCode == code;
    return GestureDetector(
      onTap: () => appState.setLanguage(code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
=======
  Widget _langChip(BuildContext context, String code, String label, AppState appState) {
    final selected = appState.languageCode == code;
    return GestureDetector(
      onTap: () => appState.setLanguage(code),
      child: Container(
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: TextStyle(
<<<<<<< HEAD
                color: selected ? Colors.white : AppColors.textGrey,
                fontWeight: FontWeight.w700)),
=======
                color: selected ? Colors.white : context.colors.textGrey, fontWeight: FontWeight.w700)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      ),
    );
  }

<<<<<<< HEAD
  Widget _switchTile({
=======
  Widget _switchTile(
    BuildContext context, {
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
<<<<<<< HEAD
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
=======
      decoration: BoxDecoration(color: context.colors.card, borderRadius: BorderRadius.circular(14)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
=======
                Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: context.colors.textDark)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: context.colors.textGrey)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
              ],
            ),
          ),
          Switch(value: value, activeColor: AppColors.primary, onChanged: onChanged),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _linkTile(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
=======
  Widget _linkTile(BuildContext context, IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(color: context.colors.card, borderRadius: BorderRadius.circular(14)),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
<<<<<<< HEAD
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
          const Icon(Icons.chevron_right, color: AppColors.textGrey),
=======
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: context.colors.textDark))),
          Icon(Icons.chevron_right, color: context.colors.textGrey),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
