import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

export 'package:video_player/video_player.dart';

class HeyTeaKit {
  static const String packageName = 'heytea_kit';
  static const MethodChannel _channel = const MethodChannel(packageName);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 请在APP启动时配置 HeyTeaKit
  static HeyTeaKitConfig? config;

  static popRoute<T extends Object>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    } else {
      SystemNavigator.pop();
    }
  }
}

typedef HasSignIn = bool Function();
typedef AppVersionCodeGetter = int Function();
typedef APIBaseUrlsGetter = Future<List<String>> Function();
typedef APITokenGenerator = Future<String> Function();

class HeyTeaKitConfig {
  final BuildContext buildContext;

  final HasSignIn hasSignIn;
  final WidgetBuilder navigateToSignIn;
  final AppVersionCodeGetter appVersionCodeGetter;
  final APIBaseUrlsGetter apiBaseUrlsGetter;
  final APITokenGenerator apiTokenGenerator;

  const HeyTeaKitConfig(
    this.buildContext, {
    // 获取登录状态
    required this.hasSignIn,
    // 返回登录页
    required this.navigateToSignIn,
    required this.appVersionCodeGetter,
    required this.apiBaseUrlsGetter,
    required this.apiTokenGenerator,
  });
}
