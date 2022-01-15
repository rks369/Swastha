import 'package:flutter/material.dart';
import 'package:swastha/screens/verify_password.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class CreatePassword extends StatefulWidget {
  static const String id = 'CreatePassword';

  const CreatePassword({Key? key}) : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RoundedButton(
          title: 'Continue',
          colour: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, VerifyPassword.id);
          }),
    );
  }
}
