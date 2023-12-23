import 'package:flutter/material.dart';

class Unfocus extends StatefulWidget {
  const Unfocus({super.key, this.child});

  final Widget? child;

  @override
  State<Unfocus> createState() => _UnfocusState();
}

class _UnfocusState extends State<Unfocus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: widget.child,
    );
  }
}
