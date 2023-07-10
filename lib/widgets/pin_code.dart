import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveFillColor: Colors.grey[200],
        activeFillColor: Colors.white,
        activeColor: context.theme.primaryColor,
        selectedFillColor: context.theme.primaryColor,
        selectedColor: context.theme.primaryColor,
        inactiveColor: Colors.grey[500],
      ),
      animationDuration: const Duration(milliseconds: 300),
      textStyle: const TextStyle(fontSize: 20),
      onChanged: (value) {},
      onCompleted: (value) {},
    );
  }
}
