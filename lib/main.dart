import 'package:flutter/material.dart';
import 'package:test_mak_it/constants/app_colors.dart';
import 'package:test_mak_it/ui/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primary,
          backgroundColor: AppColors.background,
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
