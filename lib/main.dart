import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_posy/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Hubungkan ke Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // -----------------------------------------
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