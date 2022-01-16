import 'package:flutter/material.dart';
import 'package:swastha/utils/styles.dart';

class DashBoard extends StatelessWidget {
  static const String id = 'DashBoard';

  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
