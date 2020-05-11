import 'package:flutter/cupertino.dart';
import 'package:heytea_kit/const/ui_constants.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/res/icons.dart';

class HeyTeaStyle {

  static Widget topBarIconButton({
    @required IconData iconData,
    @required Color color,
    double size = 28,
  }) {
    return SizedBox(
      width: UIConstants.minInteractiveDimension,
      height: UIConstants.minInteractiveDimension,
      child: Icon(
        iconData,
        color: color,
        size: size,
      ),
    );
  }

  static CupertinoButton cupertinoButton({
    Key key,
    @required Widget child,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Color color,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    double minSize = 0,
    double pressedOpacity = 0.4,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0)),
    @required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      key: key,
      child: child,
      padding: padding,
      color: color,
      disabledColor: disabledColor,
      minSize: minSize,
      pressedOpacity: pressedOpacity,
      borderRadius: borderRadius,
      onPressed: onPressed,
    );
  }

  static checkBoxIcon(double size, bool isChecked) {
    final assetName =
        isChecked ? HeyTeaIcons.check_box_checked : HeyTeaIcons.check_box;

    return Image(
      image: AssetImage(assetName, package: HeyTeaKit.packageName),
      width: size,
      height: size,
    );
  }
}
