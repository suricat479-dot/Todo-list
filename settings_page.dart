import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) onToggleTheme;
  const SettingsPage({super.key, 
    required this.onToggleTheme,});

    @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  

  @override
  Widget build(BuildContext context) {
    print("Settings page - build");

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SwitchListTile(
        title: const Text('Dark theme'),
        value: Theme.of(context).brightness == Brightness.dark,
        onChanged: (switchPosition) {
          widget.onToggleTheme(switchPosition);
          print(switchPosition);
        },
      ),
    );
  }
}
