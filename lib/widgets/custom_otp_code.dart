import 'package:flutter/material.dart';

class OTPTextField extends StatefulWidget {
  final int length;
  final Function(String) onChanged;

  const OTPTextField(
      {super.key, required this.length, required this.onChanged});

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  List<FocusNode> focusNodes = [];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      focusNodes.add(FocusNode());
      controllers.add(TextEditingController());
      if (i != 0) {
        focusNodes[i].addListener(
          () {
            if (focusNodes[i].hasFocus && controllers[i - 1].text.isEmpty) {
              FocusScope.of(context).requestFocus(focusNodes[i - 1]);
            }
          },
        );
      }
      controllers[i].addListener(
        () {
          String value = controllers[i].text;
          if (value.length == 1) {
            widget.onChanged(value);
            if (i != widget.length - 1) {
              FocusScope.of(context).requestFocus(focusNodes[i + 1]);
              setState(() {});
            }
          } else if (value.isEmpty && i != 0) {
            FocusScope.of(context).requestFocus(focusNodes[i - 1]);
            setState(() {});
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => Container(
          margin: const EdgeInsets.all(4.0),
          width: 40.0,
          height: 50.0,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            ),
          ),
        ),
      ),
    );
  }
}
