import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';

class SchoolList extends StatelessWidget {
  const SchoolList({super.key, this.onChanged, this.school});
  final ValueChanged<String>? onChanged;
  final String? school;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          20,
          (index) => ListTile(
            title: Text(school == "School $index"
                ? school ?? "School $index"
                : "School $index"),
            onTap: () {
              onChanged?.call("School $index");
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: school == "School $index"
                  ? context.theme.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
