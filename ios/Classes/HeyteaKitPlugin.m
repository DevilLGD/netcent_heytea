#import "HeyteaKitPlugin.h"
#if __has_include(<heytea_kit/heytea_kit-Swift.h>)
#import <heytea_kit/heytea_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "heytea_kit-Swift.h"
#endif

@implementation HeyteaKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHeyteaKitPlugin registerWithRegistrar:registrar];
}
@end
