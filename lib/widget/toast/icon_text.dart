import 'package:flutter/material.dart';
import 'package:heytea_kit/heytea_const.dart';

/// 图标+文字的Widget
class IconTextWidget extends StatelessWidget {
  final WidgetBuilder _widgetBuilder;
  final String _text;

  const IconTextWidget(this._widgetBuilder, this._text, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: HeyTeaConst.toastBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_widgetBuilder != null) _widgetBuilder(context),
          if (_text != null)
            Text(
              _text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
