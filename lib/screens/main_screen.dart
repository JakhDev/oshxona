import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
<<<<<<< HEAD
import 'categories_screen.dart';
=======
import 'salads_screen.dart';
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import 'saved_screen.dart';
import 'profile_screen.dart';

/// Ilovaning "shell"i — pastki tab-bar orqali 4 ta asosiy bo'lim orasida
<<<<<<< HEAD
/// animatsiyali almashadi (Bosh, Kategoriya, Saqlangan, Profil).
=======
/// almashadi. IndexedStack ishlatiladi: har bir ekran doim to'liq
/// ekran balandligini egallaydi va tablar orasida sakrash/miltillash
/// bo'lmaydi (har bir ekran holati saqlanib qoladi).
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
<<<<<<< HEAD
    CategoriesScreen(),
=======
    SaladsScreen(),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: KeyedSubtree(
          key: ValueKey<int>(_index),
          child: _screens[_index],
        ),
        transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
      ),
=======
      body: IndexedStack(index: _index, children: _screens),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      bottomNavigationBar: BottomNavBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
