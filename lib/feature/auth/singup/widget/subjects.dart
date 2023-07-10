import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';

class SubjectsList extends StatelessWidget {
  const SubjectsList({super.key, this.onChanged, this.subject});
  final ValueChanged<String>? onChanged;
  final String? subject;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          20,
          (index) => ListTile(
            title: Text(subject == "Subject $index"
                ? subject ?? "Subject $index"
                : "Subject $index"),
            onTap: () {
              onChanged?.call("Subject $index");
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: subject == "Subject $index"
                  ? context.theme.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
