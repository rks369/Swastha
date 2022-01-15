import 'package:flutter/material.dart';
import 'package:swastha/screens/picture_detail.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class NameDetail extends StatefulWidget {
  static const String id = 'NameDetail';
  const NameDetail({Key? key}) : super(key: key);

  @override
  _NameDetailState createState() => _NameDetailState();
}

class _NameDetailState extends State<NameDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RoundedButton(
          title: 'Continue',
          colour: primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, PictureDetail.id);
          }),
    );
  }
}
