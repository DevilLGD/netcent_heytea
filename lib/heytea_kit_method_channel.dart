import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'heytea_kit_platform_interface.dart';

/// An implementation of [HeyteaKitPlatform] that uses method channels.
class MethodChannelHeyteaKit extends HeyteaKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('heytea_kit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
