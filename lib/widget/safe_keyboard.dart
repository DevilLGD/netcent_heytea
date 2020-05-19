import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:heytea_kit/const/ui_constants.dart';
import 'package:heytea_kit/res/colors.dart';
import 'package:heytea_kit/utils/widget_utils.dart';

class SafeKeyboardDialogChild extends StatefulWidget {
  final String title;
  final int passwordLength;
  final VoidCallback onCloseTap;

  SafeKeyboardDialogChild({
    this.title,
    this.passwordLength = 6,
    this.onCloseTap,
  });

  @override
  State<StatefulWidget> createState() {
    return SafeKeyboardDialogChildState();
  }
}

class SafeKeyboardDialogChildState extends State<SafeKeyboardDialogChild> {
  final ValueNotifier<List<String>> inputsNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();

    inputsNotifier.addListener(() {
      final inputs = inputsNotifier.value;
      if (inputs.length >= widget.passwordLength) {
        Navigator.of(context).pop(inputs.join());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    inputsNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeKeyboard(
        title: widget.title,
        passwordLength: widget.passwordLength,
        inputsNotifier: inputsNotifier,
        onCloseTap: widget.onCloseTap ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}

class SafeKeyboard extends StatelessWidget {
  static const _deleteKey = "DELETE";
  static final _numKeyList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  final keyList = List.from(_numKeyList)
    ..shuffle()
    ..add(_deleteKey);
  final _inputs = <String>[];

  final String title;
  final int passwordLength;
  final VoidCallback onCloseTap;
  final ValueNotifier<List<String>> inputsNotifier;

  SafeKeyboard({
    this.title,
    this.passwordLength = 6,
    this.onCloseTap,
    @required this.inputsNotifier,
  }) {
    inputsNotifier.value = _inputs;
  }

  @override
  Widget build(BuildContext context) {
    final topBar = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        if (title != null)
          Text(
            title,
            style: TextStyle(
              color: HeyTeaColors.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: HeyTeaStyle.cupertinoButton(
            child: Icon(
              Icons.close,
              size: 20,
              color: HeyTeaColors.secondaryText,
            ),
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            onPressed: onCloseTap,
          ),
        ),
      ],
    );
    final editor = ValueListenableBuilder<List<String>>(
      valueListenable: inputsNotifier,
      builder: (context, value, child) {
        return StaggeredGridView.countBuilder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          crossAxisCount: passwordLength,
          itemBuilder: (context, index) {
            final isNotBlank = index < value.length;

            return AspectRatio(
              aspectRatio: 1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  isNotBlank ? "*" : "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          itemCount: passwordLength,
          crossAxisSpacing: 12,
        );
      },
    );
    final keyboard = StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(12),
      crossAxisCount: 3,
      itemBuilder: (context, index) {
        final key = keyList[index];
        Widget keyChild;
        if (key == _deleteKey) {
          keyChild = Icon(
            Icons.backspace,
            size: 18,
            color: HeyTeaColors.primaryText,
          );
        } else {
          keyChild = Text(
            key,
            style: const TextStyle(
              color: HeyTeaColors.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          );
        }

        return SizedBox(
          height: UIConstants.minInteractiveDimension,
          child: HeyTeaStyle.cupertinoButton(
            child: keyChild,
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            onPressed: () {
              if (key == _deleteKey) {
                if (_inputs.isNotEmpty) {
                  inputsNotifier.value = List.from(_inputs..removeLast());
                }
              } else if (_inputs.length < passwordLength) {
                inputsNotifier.value = List.from(_inputs..add(key));
              }
            },
          ),
        );
      },
      staggeredTileBuilder: (index) {
        if (index == keyList.length - 2) {
          // 10个数字加上Delete一共11个键，不能排满4行，所以我们给倒数第二行占据两格
          return const StaggeredTile.fit(2);
        } else {
          return const StaggeredTile.fit(1);
        }
      },
      itemCount: keyList.length,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
    );

    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        color: HeyTeaColors.weakColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          topBar,
          editor,
          keyboard,
        ],
      ),
    );
  }
}
