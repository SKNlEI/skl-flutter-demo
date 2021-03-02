import 'package:flutter/material.dart';
import 'dart:math';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(20, (index) =>
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 10, bottom: 20),
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255))
        )
      ),
    );
  }
}
