import 'package:flutter/material.dart';
import 'package:swastha/screens/create_password.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/screens/extra_user_detail.dart';
import 'package:swastha/screens/login.dart';
import 'package:swastha/screens/name_detail.dart';
import 'package:swastha/screens/on_boarding.dart';
import 'package:swastha/screens/parameters_detail.dart';
import 'package:swastha/screens/picture_detail.dart';
import 'package:swastha/screens/register.dart';
import 'package:swastha/screens/verify_and_create_password.dart';
import 'package:swastha/screens/verify_password.dart';
import 'package:swastha/screens/parameters_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnBoardingScreen.id,
      routes: {
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        VerifyAndCreatePassword.id: (context) => const VerifyAndCreatePassword(),
        ExtraUserDetail.id: (context) => const ExtraUserDetail(),
        DashBoard.id : (context)=> const DashBoard(),
        VerifyPassword.id:(context)=> const VerifyPassword(),
        CreatePassword.id :(context)=> const CreatePassword(),
        PictureDetail.id : (context)=> const PictureDetail(),
        NameDetail.id : (context)=> const NameDetail(),
      ParameterDetail.id: (context)=> const ParameterDetail()

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
