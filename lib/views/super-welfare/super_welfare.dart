import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../service/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../widgets/discount_item.dart';
import '../../widgets/counter_down.dart';
import './to_see_modal.dart';
import '../../model/thrift_amount.dart';
import '../../model/limit_packlist.dart';
import '../../model/bubble_dto.dart';
import '../../service/service.dart';

var paramsInfo = {
  "positionId":
      "wxapp-superWelfare-top,wxapp-superWelfare-middle,wxapp-superWelfare-bottom"
};

class SuperWelfare extends StatefulWidget {
  @override
  _SuperWelfareState createState() => _SuperWelfareState();
}

class _SuperWelfareState extends State<SuperWelfare> {
  List _advertisementList = [];
  ThriftAmountObj _thriftAmount;
  BubbleModelObj _bubbleModelObj;

  @override
  void initState() {
    _getInfo();
    _getBubbleInfo();
    _getSuperWelfareThriftAmount();
    super.initState();
  }

  void _getInfo() async {
    Response res = await SklHttp.instance.post(SklApi.cxAdvertiseInfo, paramsInfo);
    setState(() {
      _advertisementList = res.data['obj']['wxapp-superWelfare-top'];
    });
  }

  void _getSuperWelfareThriftAmount() async {
    Response res = await SklHttp.instance.post(SklApi.superWelfareThriftAmount, {});
    ThriftAmount result = ThriftAmount.fromJson(res.data);
    setState(() {
      _thriftAmount = result.obj;
    });
  }

  void _getBubbleInfo() async {
    Response res = await SklHttp.instance.post(SklApi.sfWelfareBubble, {"location":"2"});
    BubbleModel result = BubbleModel.fromJson(res.data);
    setState(() {
      _bubbleModelObj = result.obj;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TopSwiper(advertisementList: _advertisementList,),
            PreferentialBill(_thriftAmount),
            CardShow(_bubbleModelObj),
            FullPresentProgress(),
            LimitedList(),
            DiscountPackage()
          ],
        ),
      ),
    );
  }
}

/// 轮播图组件
class TopSwiper extends StatelessWidget {
  TopSwiper({Key key, this.advertisementList}) : super(key: key);
  final List advertisementList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Swiper(
        loop: false,
        onTap: (i) => {print('点击了$i')},
        itemCount: advertisementList.length,
        itemBuilder: (context, index) {
          return Image.network(
            advertisementList[index]['imageUrl'],
            fit: BoxFit.fill,
          );
        },
        pagination: advertisementList.length > 1 ? SwiperPagination() : null,
      ),
    );
  }
}

class PreferentialBill extends StatelessWidget {
  final ThriftAmountObj _thriftAmount;
  PreferentialBill(this._thriftAmount, {Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    print(_thriftAmount);
    return Container(
      height: 40,
      color: Color.fromRGBO(255, 239, 226, 1.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 40.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('images/calculator.png', height: 18, fit: BoxFit.fill),
              SizedBox(width: 7.0),
              _textRich()
            ],
          ),
          InkWell(child: Text('去查看 >'), onTap: () => _toSeeModal(context))
        ],
      ),
    );
  }

  Text _textRich() {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: '超值福利平均能为您节省'),
        TextSpan(
          text: '${_thriftAmount?.thriftAmount}元',
          style: TextStyle(color: Colors.red))
      ]),
    );
  }

  void _toSeeModal (BuildContext context) async {
    print('点击了当前');
    bool delete = await showDeleteConfirmDialog(context);

    print(delete);

  }

  Future<bool> showDeleteConfirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          backgroundColor: Colors.transparent,
          content: ToSeeModal(_thriftAmount)
        );
      }
    );
  }
}

/// 中间卡片展示
// ignore: must_be_immutable
class CardShow extends StatelessWidget {
  final BubbleModelObj _bubbleInfo;
  CardShow(this._bubbleInfo, { Key key }): super(key: key);

  Widget showCardItem(imageUrl, title, subTitle, v) {
    return Expanded(
      child: InkWell(
        child: Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Column(
              children: [
                Image.asset(imageUrl, fit: BoxFit.fill, width: 60),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(title, style: TextStyle(fontWeight: FontWeight.w600),),
                ),
                Text(subTitle)
              ],
            ),
            v.isEmpty || v == null ? Text('') : Positioned(
              right: -10,
              top: -12,
              child: DecoratedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(v, style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFF6D66), Color(0xffE13028)]
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  )
                ),
              ),
            )
          ],
        ),
        onTap: () => {print('点击的页面$title')},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('-------------xandhdkl---------');
    print(_bubbleInfo);
    return Container(
      child: Row(
        children: [
          showCardItem('images/sf_svip.png', 'SVIP会员卡', '18元尊享SVIP', _bubbleInfo?.svip),
          showCardItem('images/sf_new_card.png', '新速运通卡', '充值立享返利', _bubbleInfo?.express),
          showCardItem('images/sf_gift.png', '顺丰礼品卡', '送礼就送顺丰卡', _bubbleInfo?.gift)
        ],
      ),
    );
  }
}

/// 寄件满赠进度条
class FullPresentProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
      padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('images/welfare_icon.png', height: 40, fit: BoxFit.fill,),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: VerticalDivider(width: 2, color: Color.fromRGBO(153, 153, 153, .5))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('寄件满赠福利', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('速来激活月度寄件福利')
                ],
              )
            ],
          ),
          Container(
            width: 80.0,
            height: 36.0,
            alignment: Alignment.center,
            child: Text('查看', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(246, 246, 246, 1.0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    );
  }
}

/// 限购列表组件
class LimitedList extends StatefulWidget {
  @override
  _LimitedListState createState() => _LimitedListState();
}

class _LimitedListState extends State<LimitedList> {
  LimitPacketListObj _limitList;

  @override
  void initState() {
    _getLimitListData();
    super.initState();
  }

  void _getLimitListData() async {
    Response res =  await SklHttp.instance.post(SklApi.packetList, {"packetType": 3});
    LimitPacketList result = LimitPacketList.fromJson(res.data);
    setState(() {
      _limitList = result.obj;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build------>$_limitList');
    return Container(
      child: _limitList == null
          ? CircularProgressIndicator()
          : Column(children: [_limitListTitle(), _limitListContainer()]),
    );
  }

  Widget _limitListTitle() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('今日限抢', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          SizedBox(width: 10.0),
          CountDownShow(_limitList.countDown),
          SizedBox(width: 8),
          Text('热抢中', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red))
        ],
      ),
    );
  }

  Widget _limitListContainer() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 20),
      child: Row(
        children: [
          _limitItem(_limitList.list.first),
          SizedBox(width: 10),
          _limitItem(_limitList.list.last)
      ]
    ));
  }

  void _homeDetailPage(String packetId) {
    print(packetId);
    Future<dynamic> test = Navigator.of(context).pushNamed('/welfareDetail', arguments: packetId);
    test.then((value) => print('value-------->$value'));
  }

  Widget _limitItem(PackList listItem) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => _homeDetailPage(listItem.packetId),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.0, 2.0), blurRadius: 2.0)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(listItem.packetPic, width: double.infinity, fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 30),
                child: Text(listItem.packetName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("￥${listItem.realPrice}", style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Text("￥${listItem.originalPrice}", style: TextStyle(color: Colors.black45, decoration: TextDecoration.lineThrough))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 10,
                          width: 100,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.red),
                            value: listItem.currentStock / listItem.stock,
                            backgroundColor: Color.fromRGBO(220, 30, 50, 0.24),
                          )),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('${listItem.currentStock}/${listItem.stock}', style: TextStyle(color: Colors.red))
                  ],
                ),
              )
            ],
          ),
        ),
      ));
  }
}

/// 优惠套餐列表
class DiscountPackage extends StatefulWidget {
  @override
  _DiscountPackageState createState() => _DiscountPackageState();
}

class _DiscountPackageState extends State<DiscountPackage> {
  List _discountList = [];

  @override
  void initState() {
    _getDiscountList();
    super.initState();
  }

  void _getDiscountList() async {
    Response res = await SklHttp.instance.post(SklApi.packetList, {"packetType": 4, "pageSize": 5});
    setState(() {
      _discountList = res.data['obj']['list'];
    });
  }

  List<Widget> _generateDiscount() {
    return _discountList.map((e) {
      return DiscountItem(e);
    }).toList();
  }

  Widget _generateDiscountTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("优惠寄件套餐", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        InkWell(
          onTap: () {Navigator.pushNamed(context, '/discountPacket');},
          child: Text("更多 >", style: TextStyle(color: Colors.black54)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = [_generateDiscountTitle()];
    childList.addAll(_generateDiscount());

    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: _discountList == null
        ? CircularProgressIndicator()
        : Column(children: childList),
    );
  }
}
