import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleProvider with ChangeNotifier {
  int _num = 0;
  int get num =>
      _num; // getter func to be called to get the value of _num outside this class

  void setCount() {
    // it sets the new value of _num
    _num++;
    notifyListeners();
  }
}

class SliderProvider with ChangeNotifier {
  double _sval = 1;
  double get sval => _sval;
  void setSVal(double newSVal) {
    _sval = newSVal;
    notifyListeners();
  }
}

class ThemeChangeProvider with ChangeNotifier {
  static final ThemeData _lightThemeData = ThemeData(
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.red)),
    canvasColor: Colors.amber,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.brown),
    primaryColor: Colors.red,
    backgroundColor: Colors.amber,
    appBarTheme: AppBarTheme(backgroundColor: Colors.red),
  );
  static final ThemeData _darkThemeData = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.purple[900]),
    canvasColor: Colors.grey[850],
    primaryColor: Colors.blueGrey[900],
    backgroundColor: Colors.grey[850],
    appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900]),
  );
  ThemeData _themeData = _lightThemeData;
  ThemeData get themeData => _themeData;

  void setTheme(String data) {
    if (data == 'light') {
      _themeData = _lightThemeData;
    } else {
      _themeData = _darkThemeData;
    }
    notifyListeners();
  }
}
