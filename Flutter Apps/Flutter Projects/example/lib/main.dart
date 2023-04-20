import 'package:example/fav/fav_provider.dart';
import 'package:example/fav/fav_screen.dart';
import 'package:example/home_page.dart';
import 'package:example/login_provider.dart';
import 'package:example/provider_class.dart';
import 'package:example/screens/darkTheme.dart';
import 'package:example/screens/login_screen.dart';
import 'package:example/screens/value_notify_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExampleProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavItemProvider()),
        ChangeNotifierProvider(create: (context) => ThemeChangeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangeProvider = Provider.of<ThemeChangeProvider>(context);
          return MaterialApp(
            home: LoginScreen(),
            theme: themeChangeProvider.themeData,
          );
        },
      ),
    );
  }
}
