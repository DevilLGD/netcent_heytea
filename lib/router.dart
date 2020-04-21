import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:heytea_kit/heytea_kit.dart';

typedef Widget RouterHandler(
  BuildContext context,
  Map<String, dynamic> parameters,
);

class HeyTeaRouter {
  /// 使用我们定制的Handler，根据需求决定是否去登录
  static Handler handlerOf(
    RouterHandler onScreen, {
    bool requireSignIn = false,
  }) {
    return Handler(
      handlerFunc: (
        BuildContext context,
        Map<String, dynamic> params,
      ) {
        final hasSignIn = HeyTeaKit.config?.hasSignIn() == true;
        if (requireSignIn && !hasSignIn) {
          // 去登录
          return HeyTeaKit.config?.navigateToSignIn(context);
        } else {
          return onScreen(context, params);
        }
      },
    );
  }
}
