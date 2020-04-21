import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/res/colors.dart';
import 'package:heytea_kit/res/icons.dart';

class HeyTeaStyle {
  static const backLight = SizedBox(
    width: kMinInteractiveDimension,
    height: kMinInteractiveDimension,
    child: Icon(
      CupertinoIcons.back,
      color: HeyTeaColors.primaryText,
      size: 28,
    ),
  );
  static const backDark = SizedBox(
    width: kMinInteractiveDimension,
    height: kMinInteractiveDimension,
    child: Icon(
      CupertinoIcons.back,
      color: Colors.white,
      size: 28,
    ),
  );

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
