import 'package:flutter/material.dart';
import 'package:swastha/screens/name_detail.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';


class VerifyPassword extends StatefulWidget {
  static const String id = 'VerifyPasssword';
  const VerifyPassword({Key? key}) : super(key: key);

  @override
  _VerifyPasswordState createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RoundedButton(
          title: 'Continue',
          colour: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, NameDetail.id);
          }),
    );
  }
}

