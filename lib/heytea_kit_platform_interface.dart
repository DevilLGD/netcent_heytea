import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'heytea_kit_method_channel.dart';

abstract class HeyteaKitPlatform extends PlatformInterface {
  /// Constructs a HeyteaKitPlatform.
  HeyteaKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static HeyteaKitPlatform _instance = MethodChannelHeyteaKit();

  /// The default instance of [HeyteaKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelHeyteaKit].
  static HeyteaKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HeyteaKitPlatform] when
  /// they register themselves.
  static set instance(HeyteaKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
