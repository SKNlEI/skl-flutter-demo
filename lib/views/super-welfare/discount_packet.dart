import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../service/api.dart';
import '../../widgets/discount_item.dart';
import '../../service/service.dart';

class DiscountPacket extends StatefulWidget {
  @override
  _DiscountPacketState createState() => _DiscountPacketState();
}

class _DiscountPacketState extends State<DiscountPacket> {

  List _discountPactList = [];

  @override
  void initState() {
    _getDiscountPacket();
    super.initState();
  }

  void _getDiscountPacket() async {
    Response res = await SklHttp.instance.post(SklApi.packetList, {"packetType":4,"pageNum":1,"pageSize":10});

    print(res.data);
    setState(() {
      _discountPactList = res.data['obj']['list'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('优惠寄件套餐', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white38,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ListView.builder(
          itemCount: _discountPactList.length,
          itemBuilder: (context, index) {
            return DiscountItem(_discountPactList[index]);
        }),
      )
    );
  }
}
