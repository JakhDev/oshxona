import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';

/// 14-ekran: "Sozlamalar" — til, kunduzgi/kechki tema, bildirishnomalar.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        leading: BackButton(color: context.colors.textDark),
        title: Text(t('settings_title'), style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  ],
                ),
              ),
              const SizedBox(height: 22),
              _switchTile(
                context,
                icon: Icons.dark_mode_outlined,
                title: t('settings_dark_mode'),
                subtitle: t('settings_dark_mode_sub'),
                value: appState.darkMode,
                onChanged: appState.setDarkMode,
              ),
              const SizedBox(height: 12),
              _switchTile(
                context,
                icon: Icons.notifications_none,
                title: t('profile_notifications'),
                subtitle: t('settings_notifications_sub'),
                value: appState.notificationsEnabled,
                onChanged: appState.setNotifications,
              ),
              const SizedBox(height: 22),
              _linkTile(context, Icons.info_outline, t('settings_about')),
              const SizedBox(height: 12),
              _linkTile(context, Icons.star_border, t('settings_rate')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langChip(BuildContext context, String code, String label, AppState appState) {
    final selected = appState.languageCode == code;
    return GestureDetector(
      onTap: () => appState.setLanguage(code),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: TextStyle(
                color: selected ? Colors.white : context.colors.textGrey, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _switchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: context.colors.card, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: context.colors.textDark)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: context.colors.textGrey)),
              ],
            ),
          ),
          Switch(value: value, activeColor: AppColors.primary, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _linkTile(BuildContext context, IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(color: context.colors.card, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: context.colors.textDark))),
          Icon(Icons.chevron_right, color: context.colors.textGrey),
        ],
      ),
    );
  }
}
