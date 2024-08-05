// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'heytea_kit_platform_interface.dart';

/// A web implementation of the HeyteaKitPlatform of the HeyteaKit plugin.
class HeyteaKitWeb extends HeyteaKitPlatform {
  /// Constructs a HeyteaKitWeb
  HeyteaKitWeb();

  static void registerWith(Registrar registrar) {
    HeyteaKitPlatform.instance = HeyteaKitWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
