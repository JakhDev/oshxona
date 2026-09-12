import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'categories_screen.dart';
import 'saved_screen.dart';
import 'profile_screen.dart';

/// Ilovaning "shell"i — pastki tab-bar orqali 4 ta asosiy bo'lim orasida
/// almashadi. IndexedStack ishlatiladi: har bir ekran doim to'liq
/// ekran balandligini egallaydi va tablar orasida sakrash/miltillash
/// bo'lmaydi (har bir ekran holati saqlanib qoladi).
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
