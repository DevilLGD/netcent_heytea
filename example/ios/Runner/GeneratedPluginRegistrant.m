//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<bugly_crash/BuglyCrashPlugin.h>)
#import <bugly_crash/BuglyCrashPlugin.h>
#else
@import bugly_crash;
#endif

#if __has_include(<fluwx/FluwxPlugin.h>)
#import <fluwx/FluwxPlugin.h>
#else
@import fluwx;
#endif

#if __has_include(<heytea_kit/HeyteaKitPlugin.h>)
#import <heytea_kit/HeyteaKitPlugin.h>
#else
@import heytea_kit;
#endif

#if __has_include(<package_info/FLTPackageInfoPlugin.h>)
#import <package_info/FLTPackageInfoPlugin.h>
#else
@import package_info;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<video_player/FLTVideoPlayerPlugin.h>)
#import <video_player/FLTVideoPlayerPlugin.h>
#else
@import video_player;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BuglyCrashPlugin registerWithRegistrar:[registry registrarForPlugin:@"BuglyCrashPlugin"]];
  [FluwxPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluwxPlugin"]];
  [HeyteaKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"HeyteaKitPlugin"]];
  [FLTPackageInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
