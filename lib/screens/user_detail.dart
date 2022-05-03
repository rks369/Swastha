import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/Bloc/auth_cubit.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/services/change_screen.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final TextEditingController name = TextEditingController();
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
                'Complete Registeration',
                style: kHeadingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Complete Your Profile",
                style: kSubHeadingTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              InkWell(
                onTap: () => {},
                child: const CircleAvatar(
                  radius: 100,
                  backgroundColor: kWhite,
                  child: Icon(
                    Icons.photo_camera,
                    color: kPrimaryColor,
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter Your Name',
                      labelText: 'Enter Your Name'),
                ),
              ),
              BlocConsumer<AuthCubit, authstate>(
                listener: (context, state) {
                  if (state == authstate.loggedIn) {
                    changeScreenReplacement(context, const DashBoard());
                  }
                },
                builder: (context, state) {
                  if (state == authstate.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RoundedButton(
                      title: 'Continue',
                      colour: kPrimaryColor,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).register(name.text);
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
