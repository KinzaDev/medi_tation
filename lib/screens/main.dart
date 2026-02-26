import 'package:flutter/material.dart';
import '../auth/signin_signup.dart';

void main() {
  runApp(const MeditationApp());
}

class MeditationApp extends StatelessWidget {
  const MeditationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninSignupPage(), // 👈 call your page here
    );
  }
}