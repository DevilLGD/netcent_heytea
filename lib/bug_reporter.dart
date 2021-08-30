import 'dart:async';
import 'dart:io';

import 'package:bugly_crash/bugly.dart';
import 'package:flutter/foundation.dart';
import 'package:heytea_kit/heytea_kit.dart';

/// Dart线程模型及异常捕获
/// - https://book.flutterchina.club/chapter2/thread_model_and_error_report.html
///
/// More about zones:
/// - https://api.dart.dev/stable/dart-async/Zone-class.html
/// - https://www.dartlang.org/articles/libraries/zones
class HeyTeaBugReporter {
  static final Function onPostError =
      (Object error, StackTrace stackTrace) async {
    await postException(
      type: HeyTeaKit.packageName,
      error: error.toString(),
      stackTrace: stackTrace.toString(),
    );
  };

  /// Flutter 框架为我们在很多关键的方法进行了异常捕获。
  /// 这里举一个例子，当我们布局发生越界或不合规范时，Flutter就会自动弹出一个错误界面，
  /// 这是因为Flutter已经在执行build方法时添加了异常捕获，
  static forwardFlutterErrorToCurrentZone() {
    /// onError是FlutterError的一个静态属性，它有一个默认的处理方法 dumpErrorToConsole，
    /// 如果我们想自己上报异常，只需要提供一个自定义的错误处理回调即可
    FlutterError.onError = (details) {
      FlutterError.dumpErrorToConsole(details);
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    };
  }

  static init({
    String appId = "",
    bool isDebug = false,
    String appChannel = "",
    String appPackage = "",
    String appVersion = "",
    bool isDevelopmentDevice = false,
    int userSceneTag = 0,
  }) {
    if (Platform.isAndroid) {
      Bugly.initAndroidCrashReport(
        appId: appId,
        isDebug: isDebug,
      );
    } else if (Platform.isIOS) {
      Bugly.initIosCrashReport(appId: appId);
    }

    Bugly.setAndroidAppChannel(appChannel: appChannel);
    Bugly.setAndroidAppPackage(appPackage: appPackage);
    Bugly.setAppVersion(appVersion: appVersion);
    if (isDevelopmentDevice != null) {
      Bugly.setAndroidDeviceId();
      //Bugly.setIsDevelopmentDevice(isDevelopmentDevice: isDevelopmentDevice);
    }
    if (userSceneTag != null) {
      Bugly.setUserSceneTag(userSceneTag: userSceneTag);
    }
  }

  /// 上报自定义异常.
  ///
  /// @param type 错误类型
  /// @param error 错误信息
  /// @param stackTrace 出错堆栈
  /// @param extraInfo 额外信息
  static Future<void> postException({
    String type = "",
    String error = "",
    String stackTrace = "",
    Map<String, String> extraInfo = const {},
  }) {
    return Bugly.postException(
      type: type,
      error: error,
      stackTrace: stackTrace,
      extraInfo: extraInfo,
    );
  }
}
