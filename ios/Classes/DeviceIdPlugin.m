#import "DeviceIdPlugin.h"
#import <Flutter/Flutter.h>
//public class SwiftDeviceIdPlugin: NSObject, FlutterPlugin {
//    public static func register(with registrar: FlutterPluginRegistrar) {
//        let channel = FlutterMethodChannel(name: "device_id", binaryMessenger: registrar.messenger())
//        let instance = SwiftDeviceIdPlugin()
//        registrar.addMethodCallDelegate(instance, channel: channel)
//    }
//
//    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//        result(UIDevice.current.identifierForVendor?.uuidString)
//    }
//}

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"device_id" binaryMessenger:registrar.messenger];
    DeviceIdPlugin *instance = [[DeviceIdPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

@end
