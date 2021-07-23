import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

//export 'package:fluwx/fluwx.dart';

typedef WechatListener = void Function(fluwx.BaseWeChatResponse response);

class WechatBuilder extends StatefulWidget {
  final String appId;
  final bool doOnIOS;
  final bool doOnAndroid;
  final String universalLink;

  final WechatListener? listener;
  final Function? onError;

  final WidgetBuilder? builder;

  const WechatBuilder({
    @required this.appId = "",
    this.doOnIOS = true,
    this.doOnAndroid = true,
    this.universalLink = "",
    this.listener,
    this.onError,
    @required this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    return _WechatBuilderState();
  }
}

class _WechatBuilderState extends State<WechatBuilder> {
  StreamSubscription<fluwx.BaseWeChatResponse>? _subscription;

  @override
  void initState() {
    super.initState();

    fluwx.registerWxApi(
      appId: widget.appId,
      doOnIOS: widget.doOnIOS,
      doOnAndroid: widget.doOnAndroid,
      universalLink: widget.universalLink,
    );
    if (widget.listener != null) {
      _subscription = fluwx.weChatResponseEventHandler.listen(widget.listener);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder!(context);
  }
}
