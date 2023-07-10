import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({super.key, this.onChanged, this.city});
  final ValueChanged<String>? onChanged;
  final String? city;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          20,
          (index) => ListTile(
            title: Text(
                city == "City $index" ? city ?? "City $index" : "City $index"),
            onTap: () {
              onChanged?.call("City $index");
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.check,
              color: city == "City $index"
                  ? context.theme.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
