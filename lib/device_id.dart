import 'dart:async';

import 'package:flutter/services.dart';

class DeviceId {
  static const MethodChannel _channel = const MethodChannel('device_id');

  static Future<String> get getID async {
    final String version = await _channel.invokeMethod('getID');
    return version;
  }
}
