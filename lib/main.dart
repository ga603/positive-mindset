import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  // Ensure Flutter bindings are initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase using the generated config
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PositiveMindsetApp());
}

class PositiveMindsetApp extends StatelessWidget {
  const PositiveMindsetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Positive Mindset',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}