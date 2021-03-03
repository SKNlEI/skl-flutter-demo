import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo page'),
      ),
      body: MyDemoPage(),
    );
  }
}

class MyDemoPage extends StatefulWidget {
  @override
  _MyDemoPageState createState() => _MyDemoPageState();
}

class _MyDemoPageState extends State<MyDemoPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
              child: Text(
                '在某些场景下，我们需要在回退到上一屏时同时返回一些数据。比如，我们跳转到新的一屏，‘'
                 '有两个选项让用户选择，当用户点击某个选项后会返回到第一屏，同时在第一屏可以知道用户选择的信息。',
                // softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Column(
              children: [
                Text('1'),
                Text('2')
              ],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.pink,
              child: Column(
                children: [
                  Text('222'),
                  Text('333')
                ],
              ),
            )
          ],
        ),
        ListTile(
          title: Text('this is title'),
          subtitle: Text('subtitle'),
          leading: Icon(Icons.phone, color: Colors.blue[500],),
        ),
        DocumentDemo(),
        TextDemo(),
        ButtonDemo(),
        SizedBox(height: 20),
        ImageDemo(),
        ContainerDemo(),
        ListViewDemo()
      ],
    );
  }
}

class DocumentDemo extends StatelessWidget {

  Widget _buildIconItem(IconData icon, String label) => Column(
    children: [
      Icon(icon, color: Colors.blue,),
      Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontWeight: FontWeight.w400)
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Oeschinen Lake Campground'),
                    SizedBox(height: 10),
                    Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey[500]),)
                  ],
                ),
              ),
              Icon(Icons.star, color: Colors.red),
              Text('41')
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconItem(Icons.phone, 'PHONE'),
              _buildIconItem(Icons.router, 'ROUTER'),
              _buildIconItem(Icons.share, 'SHARE'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            style: TextStyle(height: 1.5),
          )
        ],
      ),
    );
  }
}

// Text  Text.rich
class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style1 = TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 20);
    TextStyle style2 = TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.yellow);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('演示文字', style: TextStyle(fontSize: 20)),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '请阅读', style: style2),
              TextSpan(text: '《隐私服务协议》', style: style1),
              TextSpan(text: '后再购买后再购买后再购买后再购买后再购买'),
            ]
          ),
          style: TextStyle(color: Colors.green, fontSize: 15),
        )
      ],
    );
  }
}

// 按钮演示
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 20,
      children: [
        RaisedButton(
          onPressed: () {},
          // color: Colors.pink,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add), Text('增加')],
          ),
          // textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('outlineButton'),
          color: Colors.blue,
          splashColor: Colors.grey,
          textColor: Colors.white,
          height: 40,
          minWidth: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        OutlineButton(
          onPressed: () {},
          textColor: Colors.red,
          child: Text('outline'),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          borderSide: BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          textTheme: ButtonTextTheme.normal
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 40),
        ),
        TextButton(
          onPressed: () {},
          child: Text('TextButton')
        )
      ],
    );
  }
}

// 图片组件
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        Image.asset('images/sf_gift.png', height: 50),
        Container(
          height: 150,
          width: 200,
          color: Colors.red,
          child: Image.network(
            'https://ucmp-static.sf-express.com/sfoss/ad-act/infoflow/8D812C8FF2EB4F9EA9BD47B048BEC7B7.jpg',
            fit: BoxFit.cover
          ),
        ),
        Image(image: AssetImage("images/sf_svip.png")),
        Image(image: NetworkImage('https://ucmp-static.sf-express.com/sfoss/ad-act/infoflow/8D812C8FF2EB4F9EA9BD47B048BEC7B7.jpg'))
      ],
    );
  }
}

//
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('测试padding'),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              minHeight: 200,
              maxWidth: 200,
              minWidth: 200
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: UnconstrainedBox(
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 100,
            margin: EdgeInsets.only(top: 20, bottom: 60, left: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
              boxShadow: [ //阴影
                BoxShadow(
                  color:Colors.black54,
                  offset: Offset(2.0,2.0),
                  blurRadius: 4.0
                )
              ]
            ),
            transform: Matrix4.rotationZ(.2),
          ),
          Row(
            children: [
              ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('images/demo1.jpeg', width: 100,),
              ),
              SizedBox(width: 20),
              ClipRect(//将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半
                  child: Image.asset('images/demo1.jpeg', width: 100,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 500,
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          itemExtent: 140, //item延展尺寸(宽度)
          children: <Widget>[
            Container(color: Colors.black),
            Container(color: Colors.red),
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.yellow),
            Container(color: Colors.orange),
          ]),
      ),
    );
  }
}






