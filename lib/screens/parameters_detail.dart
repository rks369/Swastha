import 'package:flutter/material.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/services/change_screen.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/card.dart';
import 'package:swastha/widgets/circle_button.dart';
import 'package:swastha/widgets/round_button.dart';

class ParameterDetail extends StatefulWidget {
  const ParameterDetail({Key? key}) : super(key: key);

  @override
  _ParameterDetailState createState() => _ParameterDetailState();
}

class _ParameterDetailState extends State<ParameterDetail> {
  double newvalue = 10.0;
  Color activeColor = kPrimaryColor;
  bool selectedMale = false;
  bool selectedFemale = false;
  var ageValue = 18;
  var weightValue = 50;
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
                width: 70,
                height: 70,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          child: UserCard(
                        colour: selectedMale ? activeColor : kPrimaryColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )
                          ],
                        ),
                        onPress: () {
                          setState(() {
                            activeColor = kActiveSelect;
                            selectedMale = true;
                            selectedFemale = false;
                          });
                        },
                      )),
                      Expanded(
                          child: UserCard(
                        colour: selectedFemale ? activeColor : kPrimaryColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )
                          ],
                        ),
                        onPress: () {
                          setState(() {
                            activeColor = kActiveSelect;
                            selectedMale = false;
                            selectedFemale = true;
                          });
                        },
                      )),
                    ],
                  )),
                  Expanded(
                      child: UserCard(
                    colour: kPrimaryColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Age",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        const Text(
                          "150 cm",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        Slider(
                            value: 19.0,
                            min: 1.0,
                            max: 20.0,
                            onChanged: (value) {})
                      ],
                    ),
                    onPress: () {},
                  )),
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          child: UserCard(
                        colour: kPrimaryColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Age",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ageValue.toString(),
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleButton(
                                      icon: Icons.add,
                                      onpressed: () {
                                        setState(() {
                                          ageValue++;
                                        });
                                      }),
                                  CircleButton(
                                      icon: Icons.remove,
                                      onpressed: () {
                                        setState(() {
                                          ageValue--;
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      )),
                      Expanded(
                          child: UserCard(
                        colour: kPrimaryColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              weightValue.toString(),
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleButton(
                                      icon: Icons.add,
                                      onpressed: () {
                                        setState(() {
                                          weightValue++;
                                        });
                                      }),
                                  CircleButton(
                                    icon: Icons.remove,
                                    onpressed: () {
                                      setState(() {
                                        weightValue--;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      )),
                    ],
                  )),
                ],
              )),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: kPrimaryColor,
                  onPressed: () {
                    changeScreen(context, const DashBoard());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
