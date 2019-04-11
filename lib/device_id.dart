import 'dart:async';

import 'package:flutter/services.dart';

class DeviceId {
  static const MethodChannel _channel = const MethodChannel('device_id');

  /// Gets the id of the device
  ///
  /// The deviceid could be changed on factory reset and
  /// can be easily changed with a rooted device
  static Future<String> get getID async {
    final String uid = await _channel.invokeMethod('getID');
    return uid;
  }

  /// Gets the IMEI of the device
  ///
  /// Throws [PlatformException] if the Platform version version
  /// is lower then 26
  static Future<String> get getIMEI async {
    final String imei = await _channel.invokeMethod('getIMEI');
    return imei;
  }

  /// Gets the MEID of the device
  ///
  /// Throws [PlatformException] if the Platform version is
  /// lower then 26
  static Future<String> get getMEID async {
    final String meid = await _channel.invokeMethod('getMEID');
    return meid;
  }
}
