import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String id ='Login';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',width: 100,height: 100,),
              const SizedBox(
                height: 20,
              ),
              const Text('Login'),
            ],
          ),
        ),
      ),
    );
  }
}
