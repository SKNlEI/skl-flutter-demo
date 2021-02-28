import 'package:flutter/material.dart';
import 'init_page_items.dart';

class MainPage extends StatefulWidget {
  final Map<String, int> arguments;
  MainPage({ this.arguments });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  void initState() {
    print('********initState********');
    super.initState();
    print(widget.arguments);
    setState(() {
      _currentIndex = widget.arguments != null ? widget.arguments['sIndex'] : 0;
    });
  }

  void __handleChangeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('********渲染build********');
    return Scaffold(
      appBar: AppBar(
        title: Text("${pageTitle[_currentIndex]}", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.black54)
          )
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: '分类'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: '超值福利'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的'
            ),
          ],
          currentIndex: _currentIndex,
          onTap: __handleChangeIndex
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
