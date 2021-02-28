import 'dart:async';

class CountTime {
  String day;
  String hour;
  String min;
  String sec;

  CountTime(this.day, this.hour, this.min, this.sec);
}

Timer countDown(int endTime, callback) {

  return Timer.periodic(Duration(seconds: 1), (timer) {
    var nowTime = DateTime.now().millisecondsSinceEpoch;
    var diff = endTime - nowTime;

    if(diff <= 0) {
      callback({ 'day': '00', 'hour': '00', 'min': '00', 'sec': '00' });
      return timer.cancel();
    }
    
    var day = (diff / 1000 / 3600 / 24).floor().toString();
    var hour = handleTime((diff / 1000 / 3600 % 24).floor());
    var min = handleTime((diff / 1000 / 60).floor());
    var sec = handleTime((diff / 1000 % 60).floor());

    callback({ 'day': day, 'hour': hour, 'min': min, 'sec': sec });
  });
}

String handleTime(int num) {
  return num < 10 ? "0$num" : "$num";
}
