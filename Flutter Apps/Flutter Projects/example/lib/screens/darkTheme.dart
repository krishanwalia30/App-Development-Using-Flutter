import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_class.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChangeProvider = Provider.of<ThemeChangeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Change APP'),
      ),
      body: Column(
        children: [
          // RadioListTile<ThemeMode>(
          //     title: Text('Light Mode'),
          //     value: ThemeMode.light,
          //     groupValue: themeChangeProvider.themeMode,
          //     onChanged: themeChangeProvider.setTheme),
          // RadioListTile<ThemeMode>(
          //     title: Text('Dark Mode'),
          //     value: ThemeMode.dark,
          //     groupValue: themeChangeProvider.themeMode,
          //     onChanged: themeChangeProvider.setTheme),
          ListTile(
            // tileColor: Colors.white,
            onTap: () {
              themeChangeProvider.setTheme('light');
            },
            title: Text("Light Mode"),
          ),
          ListTile(
            onTap: () {
              themeChangeProvider.setTheme('dark');
            },
            title: Text("Dark Mode"),
          ),
          FloatingActionButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
