import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/app_state.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const OshxonaApp());
}

/// "Oshxona" — milliy va Yevropa taomlari retseptlari ilovasi.
/// MVP prototip: Flutter + statik mock ma'lumotlar (backend keyinroq ulanadi).
class OshxonaApp extends StatelessWidget {
  const OshxonaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Oshxona',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: appState.darkMode ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
