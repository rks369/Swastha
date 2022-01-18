import 'package:flutter/material.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/card.dart';
import 'package:swastha/widgets/round_button.dart';

class ParameterDetail extends StatefulWidget {
  static const String id = 'ParametersDetail';

  const ParameterDetail({Key? key}) : super(key: key);

  @override
  _ParameterDetailState createState() => _ParameterDetailState();
}

class _ParameterDetailState extends State<ParameterDetail> {
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
                width: 50,
                height: 50,
              ),
              Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Row(
                        children: <Widget>[
                          Expanded(
                              child: UserCard(colour: kPrimaryColor,
                                cardChild: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.male),
                                      Text("Male")
                                    ],
                                  ),
                                ), onPress: () {  },
                              )
                          ),
                          Expanded(
                              child: UserCard(colour: kPrimaryColor,
                                cardChild: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.female),
                                      Text("Female")
                                    ],
                                  ),
                                ), onPress: () {  },
                              )
                          ),
                        ],
                      )),
                      Expanded(child: Container(color: Colors.blue,)),
                      Expanded(child: Row(
                        children: <Widget>[
                          Expanded(
                              child: UserCard(colour: kPrimaryColor,
                                cardChild: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      RoundedButton(title: "Hey", colour: Colors.blue, onPressed: (){})
                                    ],
                                  ),
                                ), onPress: () {  },
                              )
                          ),
                          Expanded(
                              child: UserCard(colour: kPrimaryColor,
                                cardChild: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/logo.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      RoundedButton(title: "Hey", colour: Colors.blue, onPressed: (){})
                                    ],
                                  ),
                                ), onPress: () {  },
                              )
                          ),
                        ],
                      )),

                    ],
                  )
              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                  title: 'Continue',
                  colour: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, DashBoard.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
