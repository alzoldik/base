import 'package:flutter/material.dart';

Future<dynamic> showAppBottomSheet<T>({
  required BuildContext context,
  required Widget widget,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) => widget,
  );
}
