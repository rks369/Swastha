import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/Bloc/auth_state.dart';
import 'package:swastha/screens/create_password.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/services/change_screen.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class VerifyOTP extends StatefulWidget {
  static const String id = 'VerifyPassword';
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otp = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                  'Verification',
                  style: kHeadingTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter your OTP code number",
                  style: kSubHeadingTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    maxLength: 6,
                    keyboardType: TextInputType.phone,
                    decoration: kTextFieldDecoration.copyWith(
                        counter: const Offstage()),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: ((context, state) {
                    if (state is AuthLoggedInState) {
                      changeScreenReplacement(context, const DashBoard());
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Some Error Occured')));
                    }
                  }),
                  builder: ((context, state) {
                    if (state is AuthLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return RoundedButton(
                        title: "Verify",
                        colour: kPrimaryColor,
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOTP(otp.text);
                        });
                  }),
                ),
                const Text(
                  "Didn't you receive any code?",
                  style: kNormalTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Resend New Code",
                  style: kLinkTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, required bool last}) {
    return SizedBox(
      height: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: kTextFieldDecoration.copyWith(
              counter: const Offstage(),
            ),
          ),
        ),
      ),
    );
  }
}
