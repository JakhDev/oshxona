import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';

/// 14-ekran: "Sozlamalar" — til, tungi rejim, bildirishnomalar.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.textDark),
        title: const Text('Sozlamalar', style: TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('TIL', style: TextStyle(color: AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(child: _langChip(appState, "O'zbek", 'uz')),
                    Expanded(child: _langChip(appState, 'Русский', 'ru')),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              _switchTile(
                icon: Icons.dark_mode_outlined,
                title: "Qorong'u rejim",
                subtitle: 'Tungi ko\'rinish',
                value: appState.darkMode,
                onChanged: appState.setDarkMode,
              ),
              const SizedBox(height: 12),
              _switchTile(
                icon: Icons.notifications_none,
                title: 'Bildirishnomalar',
                subtitle: 'Yangi retseptlar',
                value: appState.notificationsEnabled,
                onChanged: appState.setNotifications,
              ),
              const SizedBox(height: 22),
              _linkTile(Icons.info_outline, 'Dastur haqida'),
              const SizedBox(height: 12),
              _linkTile(Icons.star_border, 'Baholash'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langChip(AppState appState, String label, String code) {
    final selected = appState.languageCode == code;
    return GestureDetector(
      onTap: () => appState.setLanguage(code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: TextStyle(
                color: selected ? Colors.white : AppColors.textGrey,
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
              ],
            ),
          ),
          Switch(value: value, activeColor: AppColors.primary, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _linkTile(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
          const Icon(Icons.chevron_right, color: AppColors.textGrey),
        ],
      ),
    );
  }
}