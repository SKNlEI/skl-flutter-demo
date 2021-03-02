import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          OutlineButton(
            child: Text('点击跳转路由'),
            onPressed: () {Navigator.pushNamed(context, '/customScrollView');},
          ),
          OutlineButton(
            onPressed: () {Navigator.pushNamed(context, '/demoPage');},
            child: Text('demo page'),
          ),
          OutlineButton(
            // 没有匹配到跳转错误页面
            onPressed: () {Navigator.pushNamed(context, '/de111moPage');},
            child: Text('跳转错误页面'),
          )
        ],
      ),
    );
  }
}
