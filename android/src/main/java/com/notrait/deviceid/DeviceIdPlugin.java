package com.notrait.deviceid;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * DeviceIdPlugin
 */
public class DeviceIdPlugin implements MethodCallHandler {
    private final Activity activity;

    /**
     * Plugin registration.
     */
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
        switch (call.method) {
            case "getID":
                result.success(Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID));
                break;
            case "getIMEI": {
                TelephonyManager manager = (TelephonyManager) activity.getApplicationContext().getSystemService(Context.TELEPHONY_SERVICE);


                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    String imei = manager.getImei();
                    if (imei == null) {
                        result.error("1", "Error getting IMEI", "");
                    }
                    result.success(imei);
                } else {
                    result.error("1", "IMEI is not available for API versions lower than 26", "");
                }
                break;
            }
            case "getMEID": {
                TelephonyManager manager = (TelephonyManager) activity.getApplicationContext().getSystemService(Context.TELEPHONY_SERVICE);


                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    String imei = manager.getMeid();
                    if (imei == null) {
                        result.error("1", "Error getting MEID", "");
                    }
                    result.success(imei);
                } else {
                    result.error("1", "MEID is not available for API versions lower than 26", "");
                }
                break;
            }
            default:
                result.notImplemented();
                break;
        }
    }
}
