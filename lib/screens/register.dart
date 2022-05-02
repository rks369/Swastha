import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/Bloc/auth_state.dart';
import 'package:swastha/screens/user_detail.dart';
import 'package:swastha/screens/verify_otp.dart';
import 'package:swastha/services/change_screen.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/circular_login_component.dart';
import 'package:swastha/widgets/round_button.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';

  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
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
                'Register',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Register YourSelf With Swastha",
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
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.smartphone,
                        color: kPrimaryColor,
                      ),
                      counter: const Offstage(),
                      hintText: 'Enter Your Mobile Number',
                      labelText: 'Enter Your Mobile Number'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Sign in with",
                style: kSubHeadingTextStyle,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularLoginOption(
                      icon: Image.asset('assets/images/google.png'),
                      onTap: () {
                        Navigator.pushNamed(context, UserDetail.id);
                      },
                    ),
                    CircularLoginOption(
                      icon: Image.asset('assets/images/fb.jpg'),
                      onTap: () {
                        Navigator.pushNamed(context, UserDetail.id);
                      },
                    ),
                    CircularLoginOption(
                      icon: Image.asset('assets/images/twitter.png'),
                      onTap: () {
                        Navigator.pushNamed(context, UserDetail.id);
                      },
                    )
                  ],
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                if (state is AuthCodeSentState) {
                  changeScreenReplacement(context, VerifyOTP());
                }
              }, builder: ((context, state) {
                if (state is AuthLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return RoundedButton(
                    title: 'Continue',
                    colour: kPrimaryColor,
                    onPressed: () {
                      String phonenum = "+91" + phone.text;
                      BlocProvider.of<AuthCubit>(context).sendOTP(phonenum);
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
