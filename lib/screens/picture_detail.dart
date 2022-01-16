import 'package:flutter/material.dart';
import 'package:swastha/screens/parameters_detail.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class PictureDetail extends StatefulWidget {
  static const String id = 'PictureDetail';
  const PictureDetail({Key? key}) : super(key: key);

  @override
  _PictureDetailState createState() => _PictureDetailState();
}

class _PictureDetailState extends State<PictureDetail> {
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
              const Text(
                'Profile Picture',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Choose Profile Picture",
                style: kSubHeadingTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, ParameterDetail.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
