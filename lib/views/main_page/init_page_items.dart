import 'package:flutter/material.dart';
import '../home_page/home_page.dart';
import '../classification_page/classification_page.dart';
import '../super-welfare/super_welfare.dart';
import '../my_page/my_page.dart';

List<Widget> pages = [
  HomePages(),
  Classification(),
  SuperWelfare(),
  MyPage()
];

List<String> pageTitle = [
  '首页',
  '分类',
  '超值福利',
  '我的'
];
