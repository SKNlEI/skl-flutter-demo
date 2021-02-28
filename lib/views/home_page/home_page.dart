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
            onPressed: () {
              Navigator.pushNamed(context, '/customScrollView');
            },
          )
        ],
      ),
    );
  }
}
