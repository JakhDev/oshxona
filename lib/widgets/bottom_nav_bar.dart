import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../theme/app_theme.dart';

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String labelKey;
  const _NavItem({required this.icon, required this.activeIcon, required this.labelKey});
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  static const _items = [
    _NavItem(icon: Icons.home_outlined, activeIcon: Icons.home, labelKey: 'nav_home'),
    _NavItem(icon: Icons.eco_outlined, activeIcon: Icons.eco, labelKey: 'nav_salads'),
    _NavItem(icon: Icons.favorite_border, activeIcon: Icons.favorite, labelKey: 'nav_saved'),
    _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, labelKey: 'nav_profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final t = context.watch<AppState>().t;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.card,
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, -4)),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (i) {
            final selected = i == currentIndex;
            final item = _items[i];
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selected ? item.activeIcon : item.icon,
                      color: selected ? AppColors.primary : context.colors.textGrey,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      t(item.labelKey),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        color: selected ? AppColors.primary : context.colors.textGrey,
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
