import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/screens/register.dart';
import 'package:swastha/services/change_screen.dart';
import 'package:swastha/utils/styles.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                'DashBoard',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(authCubit.userModel.toJSON().toString()),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocConsumer<AuthCubit, authstate>(
        listener: (context, state) {
          if (state == authstate.loggedIn) {
            changeScreenReplacement(context, const DashBoard());
          } else if (state == authstate.loggedOut) {
            changeScreenReplacement(context, const Register());
          }
        },
        builder: (context, state) {
          if (state == authstate.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FloatingActionButton(
            child: const Icon(Icons.logout),
            onPressed: () {
              authCubit.logOut();
            },
          );
        },
      ),
    );
  }
}
