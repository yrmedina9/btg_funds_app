import 'package:flutter/material.dart';
import 'package:btg_funds_app/presentation/screens/home_screen.dart';

import 'presentation/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTG Funds App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
