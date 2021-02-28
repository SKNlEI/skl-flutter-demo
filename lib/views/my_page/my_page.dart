import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../service/api.dart';
import '../../service/service.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _switchValue = false;
  bool _checkbox = false;
  String _phone;
  String _code;
  String _personData;

  void _sendValidCode() async {
    Response res = await SklHttp.instance.post(SklApi.sendValidCode, {"mobile":"$_phone"});
    print(res.data);
  }

  void _loginByMobile() async {
    var data = {"channel":"WEIXIN","mobile":"$_phone","validCode":"$_code"};
    Response res = await SklHttp.instance.post(SklApi.loginByMobile, data);
    print(res.data);
  }

  void _getPersonInfo() async {
    Response res = await SklHttp.instance.post(SklApi.personInfo, {});
    print(res.data);
    setState(() {
      _personData = res.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: '手机号',
                  hintText: '请输入手机号',
                  prefixIcon: Icon(Icons.person)
                ),
                onChanged: (String value) {
                  print(value);
                  setState(() {
                    _phone = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '验证码',
                  hintText: '请输入6位验证码',
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (String value){
                  setState(() {
                    _code = value;
                  });
                },
              ),
            ),
            OutlineButton(
              child: Text('获取验证码'),
              onPressed: _sendValidCode,
            ),
            OutlineButton(
              child: Text('点击登录'),
              onPressed: _loginByMobile,
            ),
            OutlineButton(
              child: Text('获取数据展示'),
              onPressed: _getPersonInfo,
            ),
            Text(_personData?? '' ),
            Switch(
              value: _switchValue,
              onChanged: (bool b) {
                setState(() {
                  _switchValue  = b;
                });
              }
            ),
            Checkbox(
              value: _checkbox,
              onChanged: (bool b) {
                setState(() {
                  _checkbox = b;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
