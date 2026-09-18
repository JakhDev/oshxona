import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../theme/app_theme.dart';

class NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const NavItem({required this.icon, required this.activeIcon, required this.label});
=======
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String labelKey;
  const _NavItem({required this.icon, required this.activeIcon, required this.labelKey});
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

<<<<<<< HEAD
  static const items = [
    NavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Bosh'),
    NavItem(
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view_rounded,
        label: 'Kategoriya'),
    NavItem(
        icon: Icons.favorite_border,
        activeIcon: Icons.favorite,
        label: 'Saqlangan'),
    NavItem(
        icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profil'),
=======
  static const _items = [
    _NavItem(icon: Icons.home_outlined, activeIcon: Icons.home, labelKey: 'nav_home'),
    _NavItem(icon: Icons.eco_outlined, activeIcon: Icons.eco, labelKey: 'nav_salads'),
    _NavItem(icon: Icons.favorite_border, activeIcon: Icons.favorite, labelKey: 'nav_saved'),
    _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, labelKey: 'nav_profile'),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
  ];

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
=======
    final t = context.watch<AppState>().t;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.card,
        boxShadow: const [
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, -4)),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
<<<<<<< HEAD
          children: List.generate(items.length, (i) {
            final selected = i == currentIndex;
            final item = items[i];
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
=======
          children: List.generate(_items.length, (i) {
            final selected = i == currentIndex;
            final item = _items[i];
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Padding(
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selected ? item.activeIcon : item.icon,
<<<<<<< HEAD
                      color: selected ? AppColors.primary : AppColors.textGrey,
=======
                      color: selected ? AppColors.primary : context.colors.textGrey,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
<<<<<<< HEAD
                      item.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        color: selected ? AppColors.primary : AppColors.textGrey,
=======
                      t(item.labelKey),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        color: selected ? AppColors.primary : context.colors.textGrey,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
