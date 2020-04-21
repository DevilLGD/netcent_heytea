import 'package:flutter_widgets/flutter_widgets.dart';

class ItemPositionUtils {
  static ItemPosition firstVisibleItem(Iterable<ItemPosition> positions) {
    if (positions == null || positions.isEmpty) {
      return null;
    }
    return positions
        .where((ItemPosition position) => position.itemTrailingEdge > 0)
        .reduce((ItemPosition min, ItemPosition position) =>
            position.itemTrailingEdge < min.itemTrailingEdge ? position : min);
  }

  static ItemPosition lastVisibleItem(Iterable<ItemPosition> positions) {
    if (positions == null || positions.isEmpty) {
      return null;
    }
    return positions
        .where((ItemPosition position) => position.itemLeadingEdge < 1)
        .reduce((ItemPosition max, ItemPosition position) =>
            position.itemLeadingEdge > max.itemLeadingEdge ? position : max);
  }
}
