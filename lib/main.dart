import 'package:flutter/material.dart';
import 'package:swastha/screens/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Swastha',
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
