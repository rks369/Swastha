import 'package:flutter/material.dart';
import 'package:swastha/screens/user_detail.dart';
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
                'Create Password',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create Your Own Password",
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
                  obscureText: true,
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.smartphone,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter Your Password',
                      labelText: 'Enter Your Password'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, UserDetail.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
