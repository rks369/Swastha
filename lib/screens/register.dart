import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String id ='Register';

  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Register")
        ),
      ),
    );
  }
}
