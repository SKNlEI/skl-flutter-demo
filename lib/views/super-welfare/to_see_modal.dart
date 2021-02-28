import 'package:flutter/material.dart';
import '../../model/thrift_amount.dart';

class ToSeeModal extends StatelessWidget {
  final ThriftAmountObj _thriftAmountObj;
  ToSeeModal(this._thriftAmountObj);

  final style2 = TextStyle(color: Colors.red, fontWeight: FontWeight.w800, fontSize: 34);
  final style3 = TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 15);
  final style4 = TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(color: Color(0xff6A2A14), fontWeight: FontWeight.w700, fontSize: 24);
    final style2 = TextStyle(color: Colors.red, fontWeight: FontWeight.w800, fontSize: 34);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 400,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xffFFDBB7),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage('images/bg.png'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Text('至${_thriftAmountObj.beginTime}起', style: TextStyle(color: Color(0xff6A2A14), fontSize: 18)),
              SizedBox(height: 30),
              Text('套餐平均能为您节省', style: style1),
              SizedBox(height: 15),
              _showSaveMoney(),
              SizedBox(height: 15),
              _saveFormulaText(),
              SizedBox(height: 60),
              _goMailWidget()
            ],
          ),
        ),
        buildCloseBtn(context)
      ],
    );
  }

  Row _showSaveMoney() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${_thriftAmountObj.thriftAmount}', style: style2),
        SizedBox(width: 5),
        Text('元', style: style3)
      ],
    );
  }

  Container _saveFormulaText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text("节省金额=已使用的券面额-购买成本", style: TextStyle(color: Colors.red)),
      decoration: BoxDecoration(
        color: Color.fromRGBO(220, 30, 49, 0.1),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }

  FlatButton _goMailWidget() {
    return FlatButton(
      onPressed: () {},
      color: Colors.red,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Text('去寄件', style: style4),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }

  InkWell buildCloseBtn(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () { Navigator.of(context).pop(true); },
      child: Container(
        width: 40,
        height: 40,
        child: Icon(Icons.close, color: Colors.white),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white, width: 2)
        ),
      )
    );
  }
}
