import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/tools.dart';

class CountDownShow extends StatefulWidget {
  final int endTime;
  final bool isShowDay;
  CountDownShow(this.endTime, {Key key, this.isShowDay = false}): super(key: key);
  @override
  _CountDownShowState createState() => _CountDownShowState();
}

class _CountDownShowState extends State<CountDownShow> {

  Map<String, String> _cacheTime = {};
  Timer _timer;

  @override
  void initState() {
    _immediatelyFun();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _immediatelyFun();
    });
    super.initState();
  }

  void _immediatelyFun() {
    var nowTime = DateTime.now().millisecondsSinceEpoch;
    var diff = widget.endTime - nowTime;
    if(diff <= 0) {
      setState(() {
        _cacheTime = { 'day': '00', 'hour': '00', 'min': '00', 'sec': '00' };
      });
      _timer.cancel();
    } else {
      var day = (diff / 1000 / 3600 / 24).floor().toString();
      var hour = handleTime((diff / 1000 / 3600 % 24).floor());
      var min = handleTime((diff / 1000 / 60 % 60).floor());
      var sec = handleTime((diff / 1000 % 60).floor());
      setState(() {
        _cacheTime = { 'day': day, 'hour': hour, 'min': min, 'sec': sec };
      });
    }

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

    print('组件销毁了');
  }

  Widget _timeContainer(String value, { double horizontal = 3 }) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: horizontal),
      child: Text(value ?? '', style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }

  Widget _otherWidget(String value) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(_cacheTime);
    return Container(
      height: 30,
      child: Row(
        children: [
          widget.isShowDay ? _timeContainer(_cacheTime['day'], horizontal: 7) : Text(''),
          widget.isShowDay ? _otherWidget('天') : Text(''),
          _timeContainer(_cacheTime['hour']),
          _otherWidget(':'),
          _timeContainer(_cacheTime['min']),
          _otherWidget(':'),
          _timeContainer(_cacheTime['sec']),
        ],
      ),
    );
  }
}
