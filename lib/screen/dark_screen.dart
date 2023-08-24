import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_provider.dart';

class DarkScreen extends StatefulWidget {
  const DarkScreen({super.key});

  @override
  State<DarkScreen> createState() => _DarkScreenState();
}

class _DarkScreenState extends State<DarkScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<DarkThemeProvider>(context);
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeChanger'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
              title: const Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          const Icon(Icons.favorite),
        ],
      ),
    );
  }
}
