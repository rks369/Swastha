import 'package:flutter/material.dart';
import 'package:swastha/screens/login.dart';
import 'package:swastha/screens/on_boarding.dart';
import 'package:swastha/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnBoardingScreen.id,
      routes: {
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
