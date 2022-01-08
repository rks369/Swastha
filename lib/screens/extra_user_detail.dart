import 'package:flutter/material.dart';

class ExtraUserDetail extends StatefulWidget {

  static const String id = 'ExtraUserDetail';

  const ExtraUserDetail({Key? key}) : super(key: key);

  @override
  _ExtraUserDetailState createState() => _ExtraUserDetailState();
}

class _ExtraUserDetailState extends State<ExtraUserDetail> {

  int _activeStepIndex = 0;

  List<Step> stepList() =>[
    Step(
        state:
        _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 0,
        title: const Text('')
        ,content: Container(
        child: const Text("1st")
    )),

    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text(''), content: Container(
        child: const Text("2nd")
    )),

    Step(
        state:
        _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text(''), content: Container(
        child: const Text("3rd")
    )),


  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child:
          Stepper(
            steps: stepList(),
            type:StepperType.horizontal,
            currentStep: _activeStepIndex,
            onStepContinue: (){
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                print('Submited');
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
          ),
        ))
    );
  }
}
