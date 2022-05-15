import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/utils/styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return ZoomDrawer(
      menuBackgroundColor: kPrimaryColor,
      menuScreen: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const CircleAvatar(
                radius: 75,
                backgroundColor: kWhite,
              ),
              Text(
                authCubit.userModel.name,
                style: kHeadingTextStyle.copyWith(color: kWhite),
              ),
              Text(
                authCubit.userModel.mobile,
                style: kHeadingTextStyle.copyWith(color: kWhite, fontSize: 24),
              ),
            ]),
          ),
        ),
      ),
      mainScreen: const DashBoard(),
      borderRadius: 24.0,
      showShadow: false,
      angle: -12.0,
      drawerShadowsBackgroundColor: kSecondaryColor,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
