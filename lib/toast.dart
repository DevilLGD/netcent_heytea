import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heytea_kit/animation/fade.dart';
import 'package:heytea_kit/heytea_const.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/utils/error_utils.dart';
import 'package:heytea_kit/widget/toast/icon_text.dart';
import 'package:heytea_kit/widget/toast/loading.dart';

class HeyTeaToast {
  static CancelFunc showLoading(
    String text, {
    crossPage = false,
    clickClose = false,
  }) {
    return BotToast.showCustomLoading(
      toastBuilder: (_) => LoadingWidget(text),
      clickClose: clickClose,
      ignoreContentClick: true,
      crossPage: crossPage,
    );
  }

  static CancelFunc showSuccess(
    String text, {
    crossPage = false,
    clickClose = false,
  }) {
    return showIconText(
      text,
      widgetBuilder: (_) => SvgPicture.asset(
        "images/jiazaiwanc.svg",
        package: HeyTeaKit.packageName,
        width: HeyTeaConst.toastIconSize,
        height: HeyTeaConst.toastIconSize,
      ),
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showFailure(
    String text, {
    crossPage = false,
    clickClose = false,
  }) {
    return showIconText(
      text,
      widgetBuilder: (_) => SvgPicture.asset(
        "images/tishi.svg",
        package: HeyTeaKit.packageName,
        width: HeyTeaConst.toastIconSize,
        height: HeyTeaConst.toastIconSize,
      ),
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showError(
    dynamic error, {
    crossPage = false,
    clickClose = false,
  }) {
    final errMessage = ErrorUtils.messageFrom(error);
    return showFailure(
      errMessage,
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showIconText(
    String text, {
    WidgetBuilder? widgetBuilder,
    crossPage = false,
    clickClose = false,
    duration = HeyTeaConst.toastDuration,
  }) {
    return showWidget(
      (context) => IconTextWidget(widgetBuilder, text),
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showWidget(
    WidgetBuilder widgetBuilder, {
    crossPage = false,
    clickClose = false,
    duration = HeyTeaConst.toastDuration,
  }) {
    return BotToast.showAnimationWidget(
      toastBuilder: (_) => SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: widgetBuilder(HeyTeaKit.config!.buildContext),
        ),
      ),
      animationDuration: HeyTeaConst.toastAnimationDuration,
      wrapToastAnimation:
          (AnimationController controller, CancelFunc _, Widget child) {
        return FadeAnimation(
          controller: controller,
          child: child,
        );
      },
      crossPage: crossPage,
      clickClose: clickClose,
      duration: duration,
    );
  }
}
