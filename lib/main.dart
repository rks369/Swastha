import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/screens/home.dart';
import 'package:swastha/screens/authentication/register.dart';
import 'package:swastha/screens/authentication/user_detail.dart';

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
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, authstate>(
          buildWhen: ((previous, current) {
            return previous == authstate.init;
          }),
          builder: (context, state) {
            if (state == authstate.loggedIn) {
              return const Home();
            } else if (state == authstate.loggedOut) {
              return const Register();
            } else if (state == authstate.unRegistered) {
              return const UserDetail();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
