import 'package:app_posy/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PosyApp());
}

class PosyApp extends StatelessWidget {
  const PosyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemantauan Tumbuh Kembang',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      home: const LoginScreen(),
    );
  }
}