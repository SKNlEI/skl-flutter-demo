import 'package:flutter/material.dart';

class UnKnowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('出错啦')),
      body: Center(
        child: Text('没有找到路由页面'),
      ),
    );
  }
}
