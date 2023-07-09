import 'package:base/bloc/setting/setting_bloc.dart';
import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              context.read<SettingsBloc>().updateSetting(
                    context.read<SettingsBloc>().currentSettings.copy(
                          isArabic: !context.read<SettingsBloc>().currentSettings.isArabic,
                        ),
                  );
            },
            child: Text(context.L.app_title)),
      ),
    );
  }
}
