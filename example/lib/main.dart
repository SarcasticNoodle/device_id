import 'package:flutter/material.dart';
import 'dart:async';

import 'package:device_id/device_id.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceid = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceid;
    String imei;
    String meid;

    deviceid = await DeviceId.getID;
    try {
      imei = await DeviceId.getIMEI;
      meid = await DeviceId.getMEID;
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      _deviceid = 'Your deviceid: $deviceid\nYour IMEI: $imei\nYour MEID: $meid';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Device Id example app'),
        ),
        body: new Center(
          child: new Text('$_deviceid'),
        ),
      ),
    );
  }
}
