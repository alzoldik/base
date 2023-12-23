import 'package:base/utility/route.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAppBottomSheet<T>({
  required Widget widget,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: isScrollControlled,
    context: navigator.currentContext!,
    builder: (context) => widget,
  );
}
