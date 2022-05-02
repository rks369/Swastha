import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/screens/create_password.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/screens/login.dart';
import 'package:swastha/screens/user_detail.dart';
import 'package:swastha/screens/on_boarding.dart';
import 'package:swastha/screens/parameters_detail.dart';
import 'package:swastha/screens/picture_detail.dart';
import 'package:swastha/screens/register.dart';
import 'package:swastha/screens/verify_otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        initialRoute: VerifyOTP.id,
        routes: {
          OnBoardingScreen.id: (context) => const OnBoardingScreen(),
          Login.id: (context) => const Login(),
          Register.id: (context) => const Register(),
          VerifyOTP.id: (context) => const VerifyOTP(),
          CreatePassword.id: (context) => const CreatePassword(),
          UserDetail.id: (context) => const UserDetail(),
          PictureDetail.id: (context) => const PictureDetail(),
          ParameterDetail.id: (context) => const ParameterDetail(),
          DashBoard.id: (context) => const DashBoard(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
