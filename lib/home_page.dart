import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CountdownTimer(
          controller: controller,
          // onEnd: onEnd,
          endTime: endTime,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: () {
          onEnd();
          controller.disposeTimer();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
