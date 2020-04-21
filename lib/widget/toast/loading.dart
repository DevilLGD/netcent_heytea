import 'package:flutter/material.dart';
import 'package:heytea_kit/heytea_const.dart';

/// 提示加载的Widget
class LoadingWidget extends StatelessWidget {
  final String _text;

  const LoadingWidget(this._text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: HeyTeaConst.toastBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 2.0,
          ),
          if (_text != null)
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
