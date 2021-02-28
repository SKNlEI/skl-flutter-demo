import 'package:flutter/material.dart';
import '../views/super-welfare/super_welfare.dart';
import '../views/super-welfare/discount_packet.dart';
import '../views/main_page/main_page.dart';
import '../views/super-welfare/welfare_detail.dart';
import '../views/custom_scroll_view/custom_scroll_view.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context, { arguments }) => MainPage(arguments: arguments),
  '/superWelfare': (context) => SuperWelfare(),
  '/discountPacket': (context) => DiscountPacket(),
  '/welfareDetail': (context, { arguments }) => WelfareDetail(arguments: arguments),
  '/customScrollView': (context) => CustomScrollViewTestRoute()
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  print('外层路由数据---->$settings');
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      print('***************$settings');
      final Route route = MaterialPageRoute(
        builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }
  return MaterialPageRoute(builder: (context) => MainPage());
}