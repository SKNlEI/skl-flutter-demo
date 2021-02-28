import 'package:flutter/material.dart';

class DiscountItem extends StatelessWidget {
  final Map<String, dynamic> dataItem;

  DiscountItem(this.dataItem, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(dataItem);
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 100,
      child: Row(
        children: [
          Container(
            width: 150,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(dataItem['packetPic']),
                fit: BoxFit.fitHeight
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataItem['packetName'], style: TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                    SizedBox(height: 5),
                    Row(
                        children: [
                          Text('￥${dataItem['realPrice']}'),
                          SizedBox(width: 5),
                          Text('￥${dataItem['originalPrice']}', style: TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough))
                        ]
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      dataItem['listLabel'],
                      style: TextStyle(
                          color: Color.fromRGBO(218,142,85, 1),
                          backgroundColor: Color.fromRGBO(255,238,225, 1)
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/welfareDetail', arguments: '${dataItem['packetId']}');
                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        alignment: Alignment.center,
                        child: Text('去购买', style: TextStyle(color: Colors.red)),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
