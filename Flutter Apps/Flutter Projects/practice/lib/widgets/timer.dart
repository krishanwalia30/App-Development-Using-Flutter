import 'dart:async';

import 'package:flutter/material.dart';

class OurTimer extends StatefulWidget {
  const OurTimer({super.key});

  @override
  State<OurTimer> createState() => _OurTimerState();
}

class _OurTimerState extends State<OurTimer> {
  var timeLeft;
  Timer? timer;

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => {ChangeTime()});
  }

  void ChangeTime() {
    setState(() {
      if (timeLeft == 0) {
        print('time over');
        timer?.cancel();
      } else {
        timeLeft--;
      }
    });
  }

  @override
  void initState() {
    timeLeft = 5;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('time left: $timeLeft'),
    );
  }
}
