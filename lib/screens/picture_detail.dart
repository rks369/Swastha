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
    return Container(
      child: RoundedButton(
          title: 'Continue',
          colour: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, ParameterDetail.id);
          }),
    );
  }
}
