import 'package:flutter/material.dart';
import 'package:swastha/screens/extra_user_detail.dart';
import 'package:swastha/utils/styles.dart';
import 'package:swastha/widgets/round_button.dart';

class VerifyAndCreatePassword extends StatefulWidget {
  static const String id = 'VerifyAndCreatePassword';

  const VerifyAndCreatePassword({Key? key}) : super(key: key);

  @override
  State<VerifyAndCreatePassword> createState() =>
      _VerifyAndCreatePasswordState();
}

class _VerifyAndCreatePasswordState extends State<VerifyAndCreatePassword> {
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor)),
          child: Stepper(
            type: StepperType.horizontal,
            steps: stepList(),
            currentStep: _activeStepIndex,
            onStepContinue: () {
              final isLast = _activeStepIndex == stepList().length - 1;

              if (isLast) {
                Navigator.pushNamed(context, ExtraUserDetail.id);
              } else {
                setState(() {
                  _activeStepIndex++;
                });
              }
            },
            onStepCancel: () {
              _activeStepIndex == 0
                  ? null
                  : setState(() {
                      _activeStepIndex--;
                    });
            },
            onStepTapped: (step) {
              setState(() {
                _activeStepIndex = step;
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
            state: _activeStepIndex > 0 ? StepState.complete : StepState.editing,
            isActive: _activeStepIndex >= 0,
            title: const Text('Verify'),
            content: Container()),
        Step(
            state: _activeStepIndex > 1 ? StepState.complete : StepState.editing,
            isActive: _activeStepIndex >= 1,
            title: const Text('Create Password'),
            content: Container())
      ];
}
