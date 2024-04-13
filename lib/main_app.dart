import 'package:flutter/material.dart';
import 'package:sccapwl_movil/screens/deposit_content.dart';
import 'package:sccapwl_movil/screens/edit_profile.dart';
import 'package:sccapwl_movil/screens/welcome_screen.dart';
// import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
