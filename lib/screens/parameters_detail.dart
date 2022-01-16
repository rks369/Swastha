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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: BackButton()),
              const SizedBox(
                height: 18,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, DashBoard.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
