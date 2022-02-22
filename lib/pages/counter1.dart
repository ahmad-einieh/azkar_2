import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vibration/vibration.dart';

class MyCounter1 extends StatefulWidget {
  final innerCount;

  const MyCounter1({this.innerCount});

  @override
  _MyCounter1State createState() => _MyCounter1State();
}

class _MyCounter1State extends State<MyCounter1> {
  int counter = 0;

  increment() async {
    if (counter + 1 >= widget.innerCount) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(amplitude: 128);
      }
    }
    setState(() /*async*/ {
      if (counter + 1 >= widget.innerCount) {
        counter++;
        Future.delayed(const Duration(milliseconds: 123), () {
          Navigator.pop(context);
        });
      } else {
        setState(() {
          counter++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        onPressed: () {
          increment();
        },
        child: Center(
          child: new CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 6.0,
            percent:
                counter > widget.innerCount ? 0 : counter / widget.innerCount,
            center: new Text(
              "$counter",
              style: TextStyle(
                fontSize: 35, /*color: Colors.teal*/
              ),
            ),
            //progressColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
