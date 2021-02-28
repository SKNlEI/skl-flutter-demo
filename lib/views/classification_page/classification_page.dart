import 'package:flutter/material.dart';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Column(
        children: [
          Text('文本展示', style: TextStyle(fontSize: 16, color: Colors.red)),
          Image.asset('images/coupon_bg.png'),
          FlatButton(onPressed: () { print('点我'); }, child: Text('FlatButton'), color: Colors.green),
          FloatingActionButton(onPressed: (){}, child: Text('+', style: TextStyle(fontSize: 40))),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: Image.asset('images/coupon_bg.png', fit: BoxFit.cover),
                ),
              ),
              Text('3', style: TextStyle(color: Colors.red, fontSize: 20),)
            ],
          ),
          Text('455555')
        ],
      ),
    );
  }
}
