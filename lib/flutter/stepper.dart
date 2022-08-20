import 'package:flutter/material.dart';

import 'appbar.dart';
import 'navigation_drawer.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Text(
      "Login",
      style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );

    List<Step> steps = <Step>[
      Step(
        title: const Text("Account"),
        content: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
        isActive: _currentStep == 0, //styling of active Step
        state: (_currentStep == 0 // styling
            ? StepState.editing
            : _currentStep > 0
                ? StepState.complete
                : StepState.indexed),
      ),
      Step(
        title: Text("Address"),
        content: Text("content 2"),
        isActive: _currentStep == 1,
      ),
      Step(
        title: Text("Step 3"),
        content: Text("content 3"),
        isActive: _currentStep == 2,
      ),
    ];
    return Scaffold(
      // Stepper is a flexible wrapper.
      // A parent class should pass currentStep to this widget
      // based on some logic triggered by the three callbacks that it provides.
      drawer: const MyDrawer(),
      appBar: MyAppBar(),
      body: Stepper(
          currentStep: _currentStep, // the index of the step whose content is displayed
          onStepTapped: (int index) {
            setState(() {
              _currentStep = index;
            });
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                --_currentStep;
              });
            }
          },
          onStepContinue: () {
            if (_currentStep < steps.length - 1) {
              setState(() {
                ++_currentStep;
              });
            }
            ;
          },
          steps: steps),
    );
  }
}
