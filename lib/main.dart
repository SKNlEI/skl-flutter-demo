import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'router/router.dart';
import './views/un_know_route/un_konw_route.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false
    );
  }
}