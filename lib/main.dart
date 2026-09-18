import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/app_state.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://iftjpaatxwbfwegporgu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmdGpwYWF0eHdiZndlZ3Bvcmd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk0MDA2OTIsImV4cCI6MjEwNDk3NjY5Mn0.yCTXvyf9I4kODt8DLF8xHaklfTyRAeUaIf2iv1s3Yuc',
  );
  runApp(const OshxonaApp());
}

class OshxonaApp extends StatelessWidget {
  const OshxonaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Oshxona',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const SplashScreen(),
      ),
    );
  }
}