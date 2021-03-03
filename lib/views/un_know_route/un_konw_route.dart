import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class UnKnowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('出错啦')),
      body: DeviceInfo(),
    );
  }
}

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Map<String, dynamic> _deviceInfo;

  Future<void> initPlatformState() async{
    dynamic deviceData;

    try{
      if (Platform.isIOS) {
        deviceData = await deviceInfoPlugin.iosInfo;
      } else if (Platform.isAndroid) {
        deviceData = await deviceInfoPlugin.androidInfo;
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if(!mounted) return;

    print(deviceData);
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

