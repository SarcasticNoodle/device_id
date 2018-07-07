package com.notrait.deviceid;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.provider.Settings.Secure;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** DeviceIdPlugin */
public class DeviceIdPlugin implements MethodCallHandler {
  private final Activity activity;
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {

    final MethodChannel channel = new MethodChannel(registrar.messenger(), "device_id");
    channel.setMethodCallHandler(new DeviceIdPlugin(registrar.activity()));
  }

  private DeviceIdPlugin(Activity activity) {
    this.activity = activity;
  }

  @SuppressLint("HardwareIds")
  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getID")) {
      result.success(Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID));
    } else {
      result.notImplemented();
    }
  }
}
