import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/circular_login_component.dart';
import 'package:swastha/widgets/round_button.dart';

class Login extends StatelessWidget {
  static const String id = 'Login';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: kTextFieldDecoration.copyWith(
                  prefixIcon: const Icon(Icons.person,color: primaryColor,),
                    hintText: 'Enter your email',
                    labelText: 'Enter Your Email'),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: TextField(
                obscureText: true,
                onChanged: (value) {},
                decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: const Icon(Icons.lock,color: primaryColor,),
                    hintText: 'Enter your password',
                    labelText: 'Enter your password'

                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Sign in with",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  circularLoginOption(icon:Image.asset('assets/images/google.png')),
                  circularLoginOption(icon:Image.asset('assets/images/facebook.png')),
                  circularLoginOption(icon:Image.asset('assets/images/twitter.png'))
                ],
              ),
            ),
            RoundedButton(
                title: 'Continue', colour: primaryColor, onPressed: () {})
          ],
        ),
      ),
    ));
  }
}
