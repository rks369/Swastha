import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String id ='Register';

  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

    Step(
        state:
        _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: const Text(''), content: Container(
        child: const Text("4th")
    )),

    Step(
        state:
        _activeStepIndex <= 4 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 4,
        title: const Text(''), content: Container(
        child: const Text("5th")
    )),

    Step(
        state:
        _activeStepIndex <= 5 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 5,
        title: const Text(''), content: Container(
        child: const Text("6th")
    )),

    Step(
        state:
        _activeStepIndex <= 6 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 6,
        title: const Text(''), content: Container(
        child: const Text("7th")
    )),

    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 7,
        title: const Text(''), content: Container(
        child: const Text("8th")
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stepper(
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
          )
        ),
      ),
    );
  }
}
