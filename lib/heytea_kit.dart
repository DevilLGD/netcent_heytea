import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

export 'package:video_player/video_player.dart';

typedef HasSignIn = bool Function();
typedef APITokenGenerator = String Function();

class HeyTeaKit {
  static const MethodChannel _channel = const MethodChannel('heytea_kit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static String get packageName => _channel.name;

  // 在APP启动时初始化 HeyTea Kit 的配置
  static HeyTeaKitConfig config;

  static popRoute(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}

class HeyTeaKitConfig {
  final BuildContext buildContext;

  /// 获取登录状态
  final HasSignIn hasSignIn;

  /// 返回登录页
  final WidgetBuilder navigateToSignIn;

  final List<String> apiBaseUrls;
  final APITokenGenerator apiTokenGenerator;

  const HeyTeaKitConfig(
    this.buildContext, {
    this.hasSignIn,
    this.navigateToSignIn,
    this.apiBaseUrls,
    this.apiTokenGenerator,
  });
}
