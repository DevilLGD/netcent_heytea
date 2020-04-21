import 'package:flutter/widgets.dart';

class SystemPadding extends StatelessWidget {

  final Widget child;

  const SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
      padding: EdgeInsets.fromLTRB(
          mediaQuery.viewInsets.left,
          mediaQuery.viewInsets.top,
          mediaQuery.viewInsets.right,
          mediaQuery.viewInsets.bottom,
      ),
      child: child,
      duration: const Duration(milliseconds: 300),
    );
  }
}
