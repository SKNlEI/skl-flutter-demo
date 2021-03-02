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
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Text('111'),
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
        DocumentDemo()
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
            softWrap: true,
          )
        ],
      ),
    );
  }
}


