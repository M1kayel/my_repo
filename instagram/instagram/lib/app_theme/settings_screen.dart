import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/app_theme/theme/theme_cubit.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          const SizedBox(
            height: 150,
          ),
          IconButton(
              onPressed: () {
                context.read<ThemeModeCubit>().updateTheme(
                    isDarkMode(context) ? ThemeMode.light : ThemeMode.dark);
              },
              icon: Icon(
                  isDarkMode(context) ? Icons.light_mode : Icons.dark_mode)),
        ],
      ),
    ));
  }

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}