#import "DeviceIdPlugin.h"
#import <device_id/device_id-Swift.h>

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceIdPlugin registerWithRegistrar:registrar];
}
@end
