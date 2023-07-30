import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utility/keybord_lisenter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.controller,
    this.isPassword,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines = 10,
    this.minLines = 1,
    this.hintWidget,
    this.inputFormatters,
  });
  final String? hint;
  final Widget? hintWidget;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focus = FocusNode();
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    keyboard.changeKeyBoardState(_focus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focus,
      enabled: widget.enabled,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      controller: widget.controller,
      obscureText: widget.isPassword ?? false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      inputFormatters: widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ]
          : widget.inputFormatters, // Only numbers can be entered
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
