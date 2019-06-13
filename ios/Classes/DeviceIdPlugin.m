#import "DeviceIdPlugin.h"
#import <Flutter/Flutter.h>

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"device_id" binaryMessenger:registrar.messenger];
    DeviceIdPlugin *instance = [[DeviceIdPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    result(UIDevice.currentDevice.identifierForVendor.UUIDString);
}
@end
