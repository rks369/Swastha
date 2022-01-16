import 'package:flutter/material.dart';
import 'package:swastha/screens/picture_detail.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class UserDetail extends StatefulWidget {
  static const String id = 'UserDetail';
  const UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
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
                'Your Good Name',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Your Name",
                style: kSubHeadingTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.smartphone,
                        color: primaryColor,
                      ),
                      hintText: 'Enter Your Name',
                      labelText: 'Enter Your Name'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, PictureDetail.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
