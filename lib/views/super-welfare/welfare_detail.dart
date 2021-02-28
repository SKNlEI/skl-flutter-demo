import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/parser.dart';
import '../../service/api.dart';
import '../../model/packet_detail.dart';
import '../../widgets/counter_down.dart';
import '../../service/service.dart';

class WelfareDetail extends StatefulWidget {
  final arguments;
  WelfareDetail({this.arguments});

  @override
  _WelfareDetailState createState() => _WelfareDetailState();
}

class _WelfareDetailState extends State<WelfareDetail> {
  PacketDetailDtoObj _detailPacket;

  @override
  void initState() {
    print('初始化数据${widget.arguments}');
    _getPacketDetail(widget.arguments);
    super.initState();
  }

  void _getPacketDetail(String packetId) async {
    Response res = await SklHttp.instance.post(SklApi.packetDetail, {"packetId": packetId});
    print(res.data);
    PacketDetailDto result = PacketDetailDto.fromJson(res.data);
    setState(() {
      _detailPacket = result.obj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('套餐详情', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: _detailPacket == null ? Center(
          child: CircularProgressIndicator(),
        ) : ListView(
          children: [
            // FlatButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false, arguments: { 'sIndex': 2 });
            //   },
            //   child: Text('点击跳转页面')
            // ),
            PageDetail(_detailPacket)
          ],
        )
      ),
    );
  }
}

class PageDetail extends StatelessWidget {
  final PacketDetailDtoObj _detailDtoObj;
  PageDetail(this._detailDtoObj);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.network(_detailDtoObj.packetPic),
        ),
        _detailDtoObj.countDown !=0 ? _timeAndProgress() : Text(''),
        _couponInfoWidget()
      ],
    );
  }

  Container _timeAndProgress() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      color: Color(0xfff6f6f6),
      height: 64,
      child: Row(
        children: [
          _linearProgressContainer(),
          Expanded(child: SizedBox()),
          Text('剩余时间'),
          SizedBox(width: 8),
          CountDownShow(_detailDtoObj.countDown, isShowDay: true)
        ],
      ),
    );
  }

  Row _linearProgressContainer() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 10,
            width: 80,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value:
              _detailDtoObj.currentStock / _detailDtoObj.stock,
              backgroundColor:
              Color.fromRGBO(220, 30, 50, 0.24),
            )
          ),
        ),
        SizedBox(width: 5),
        Text('${_detailDtoObj.currentStock}/${_detailDtoObj.stock}', style: TextStyle(color: Colors.red),)
      ],
    );
  }

  Widget _couponInfoWidget() {
    var document = parse(_detailDtoObj.packetRule);
    print(document.outerHtml);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(_detailDtoObj.packetName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                color: Color.fromRGBO(220, 30, 50, 0.1),
                child: Text(
                  _detailDtoObj.detailsLabel,
                  style: TextStyle(color: Color(0xffdc1e32))
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text("￥${_detailDtoObj.realPrice.toInt()}", style: TextStyle(color: Color(0xffdc1e32), fontSize: 20)),
              SizedBox(width: 5),
              Text("￥${_detailDtoObj.originalPrice.toInt()}", style: TextStyle(color: Color(0xff999999), decoration: TextDecoration.lineThrough))
            ],
          ),
          SizedBox(height: 10),
          ..._detailDtoObj.couponInfos.map((e) => CouponInfoItem(e)).toList(),
          SizedBox(height: 10),
          Text('一经购买不支持取消/退款，敬请谅解。', style: TextStyle(color: Color(0xff999999))),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
            child: Text(document.body.text, style: TextStyle(fontSize: 16)),
          )
        ],
      ),
    );
  }
}

class CouponInfoItem extends StatelessWidget {
  final CouponInfos _couponInfos;
  CouponInfoItem(this._couponInfos, { Key key }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      color: Color(0xfff6f6f6),
      child: Row(
        children: [
          _couponTypeShow(),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_couponInfos.couponName}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    Text('${_couponInfos.couponCounts}张', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20))
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  '${_couponInfos.couponType == 1
                      ? '' : '最高可抵${_couponInfos.maxExchangeMoney}元，'}'
                      '有效期${_couponInfos.invalidTm}天',
                    style: TextStyle(color: Colors.black26),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _couponTypeShow() {
    final bool isCoupon = _couponInfos.couponType == 2;
    final String couponBg = isCoupon ? 'images/coupon_bg.png' : 'images/coupon_bg1.png';
    final double discountValue = _couponInfos.pledgeMoney / 10;
    final int money = _couponInfos.pledgeMoney;
    return Container(
      width: 86,
      height: 50,
      padding: EdgeInsets.only(left: 7),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(couponBg), fit: BoxFit.fill)
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${isCoupon ? '抵' : '立'}', style: TextStyle(color: Colors.white, fontSize: 12)),
              Text('${isCoupon ? '至' : '减'}', style: TextStyle(color: Colors.white, fontSize: 12))
            ],
          ),
          SizedBox(width: 12),
          Text('${isCoupon ? discountValue : money}', style: TextStyle(color: Colors.white, fontSize: 24)),
          Text('${isCoupon ? '折' : '元'}', style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}


