import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:math';

class HomeProvider with ChangeNotifier {
  static int _num = 0;
  int get num => _num;
  void setnum() {
    ++_num;
    notifyListeners();
  }
}

class ObjectProvider with ChangeNotifier {
  static int _num1 = Random().nextInt(100) + 5;
  static int _num2 = Random().nextInt(100) + 5;

  int get num1 => _num1;
  int get num2 => _num2;

  void setnum(int val) {
    _num1 = Random().nextInt(val) + 5;
    _num2 = Random().nextInt(val) + 5;
    notifyListeners();
  }
}

class AnswerCountProvider with ChangeNotifier {
  static int _count = 0;
  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}

class TimerProvider with ChangeNotifier {
  static int _timerDuration = 60;
  int get timeLeft => _timerDuration;

  void timeChange() {
    _timerDuration--;
    notifyListeners();
  }
}
