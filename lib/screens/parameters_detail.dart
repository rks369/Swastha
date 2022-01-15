import 'package:flutter/material.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class ParameterDetail extends StatefulWidget {
  static const String id = 'ParametersDetail';

  const ParameterDetail({Key? key}) : super(key: key);

  @override
  _ParameterDetailState createState() => _ParameterDetailState();
}

class _ParameterDetailState extends State<ParameterDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RoundedButton(
          title: 'Continue',
          colour: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, DashBoard.id);
          }),
    );
  }
}
