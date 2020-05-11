import 'dart:async';

import 'package:heytea_kit/utils/alipay_utils.dart';
import 'package:flutter/widgets.dart';

typedef AlipayListener = void Function(AlipayResp response);

class AlipayBuilder extends StatefulWidget {
  final Alipay alipay;
  final WidgetBuilder builder;
  final AlipayListener listener;

  const AlipayBuilder({
    @required this.alipay,
    @required this.builder,
    this.listener,
  });

  @override
  State<StatefulWidget> createState() {
    return _AlipayBuilderState();
  }
}

class _AlipayBuilderState extends State<AlipayBuilder> {
  StreamSubscription<AlipayResp> _paySubscription;

  @override
  void initState() {
    super.initState();

    if (widget.listener != null) {
      //_paySubscription = widget.alipay.payResp().listen(widget.listener);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _paySubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
