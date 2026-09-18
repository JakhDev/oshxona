import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';
=======
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
import 'data/app_state.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

<<<<<<< HEAD
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://iftjpaatxwbfwegporgu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmdGpwYWF0eHdiZndlZ3Bvcmd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk0MDA2OTIsImV4cCI6MjEwNDk3NjY5Mn0.yCTXvyf9I4kODt8DLF8xHaklfTyRAeUaIf2iv1s3Yuc',
  );
  runApp(const OshxonaApp());
}

=======
void main() {
  runApp(const OshxonaApp());
}

/// "Oshxona" — milliy va Yevropa taomlari retseptlari ilovasi.
/// MVP prototip: Flutter + statik mock ma'lumotlar (backend keyinroq ulanadi).
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
class OshxonaApp extends StatelessWidget {
  const OshxonaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
<<<<<<< HEAD
      child: MaterialApp(
        title: 'Oshxona',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const SplashScreen(),
=======
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
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
      ),
    );
  }
}