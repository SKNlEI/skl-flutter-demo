import 'package:flutter/material.dart';
import 'package:flutter_app_skl/views/demo_page/demo_page.dart';

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin{
  TabController _tabController;
  static List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tab bar demo'),
        actions: [Icon(Icons.block)],
        actionsIconTheme: IconThemeData(
          color: Colors.red
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
        // bottom: ,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 100,
            itemExtent: 40,
            itemBuilder: (context, int i) {
              return Column(
                children: [Text('$i'), Divider(height: 2, color: Colors.red,)],
              );
            },
          ),
          PageView(
            children: [
              Container(color: Colors.red, child: Center(child: Text('pageview'),)),
              Container(color: Colors.green)
            ],
          ),
          MemberDemo()
        ],
      ),
    );
  }
}

class PointModel{
  String num;
  String title;
  String tip;

  PointModel(this.num, this.title, [this.tip]);
}



class MemberDemo extends StatelessWidget {
  final List<PointModel> _list = [
    PointModel("3元", "积分"),
    PointModel("3张", "优惠券"),
    PointModel("0元", "新速运通卡", "最高返利7%"),
    PointModel("0份", "我的兑换")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _list.map((e){

              return _itemShowWidget(e, _list.indexOf(e));
            }).toList(),
          ),
        )
      ],
    );
  }

  Column _showContent(PointModel e) =>
    Column(
      children: [
        Text(e.num, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(e.title, style: TextStyle( fontSize: 16, color: Colors.black26)),
        )
      ],
    );

  Widget _itemShowWidget(PointModel e, int i) =>
      Expanded(
        flex: 1,
        child: Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            _showContent(e),
            i == _list.length - 1 ? SizedBox() : _lineWidget(),
            e.tip != null ? _tipShow(e) : SizedBox()
          ],
        ),
      );

  Widget _lineWidget() =>
    Positioned(
      right: 0,
      child: SizedBox(
        width: 2,
        height: 40,
        child: DecoratedBox(decoration: BoxDecoration(color: Colors.black26),),
      ),
    );

  Widget _tipShow(PointModel e) =>
    Positioned(
      top: -22,
      right: -25,
      child: Align(
        child: DecoratedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            child: Text(e.tip, style: TextStyle(color: Colors.white),),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xffFD6D47), Color(0xffE52D28)]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [BoxShadow(blurRadius: 2, color: Color.fromRGBO(220, 30, 50, 4))],
            border: Border.all(color: Colors.white, width: 1)
          ),
        ),
      ),
    );
}

