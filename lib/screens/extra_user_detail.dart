import 'package:flutter/material.dart';
import 'package:swastha/screens/dashboard.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class ExtraUserDetail extends StatefulWidget {
  static const String id = 'ExtraUserDetail';

  const ExtraUserDetail({Key? key}) : super(key: key);

  @override
  _ExtraUserDetailState createState() => _ExtraUserDetailState();
}

class _ExtraUserDetailState extends State<ExtraUserDetail> {
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor)),
          child: Stepper(
            steps: stepList(),
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                Navigator.pushNamed(context, DashBoard.id);
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }
              setState(() {
                _activeStepIndex -= 1;
              });
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                        title: _activeStepIndex == stepList().length-1?'Continue':'Next',
                        onPressed: onStepContinue,
                        colour: primaryColor,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      if(_activeStepIndex!=0)
                        RoundedButton(
                            title: 'Back',
                            colour: primaryColor,
                            onPressed: onStepCancel)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Name'),
            content: const Text("1st")),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Picture'),
            content: const Text("2nd")),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Parameters'),
            content: const Text("3rd")),
      ];
}
