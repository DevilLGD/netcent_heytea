bool numToBool(num value) {
  return value != null && value != 0;
}

bool stringToBool(String value) {
  return value != null && value != "0" && value.toLowerCase() != "false";
}

int booToInt(bool value) {
  return value != null && value ? 1 : 0;
}

T findWithString<T>(Iterable<T> values, String match) {
  return values.firstWhere(
    (value) => value.toString() == match,
    //orElse: () => null,
  );
}

T? firstOrNull<T>(Iterable<T> iterable) {
  if (iterable != null && iterable.isNotEmpty) {
    return iterable.first;
  } else {
    return null;
  }
}

T? getOrNull<T>(Iterable<T> iterable, int index) {
  if (isEmptyIterable(iterable) == false &&
      index != null &&
      index < iterable.length) {
    if (iterable is List) {
      return (iterable as List)[index];
    } else {
      return iterable.elementAt(index);
    }
  } else {
    return null;
  }
}

bool isEmptyIterable(Iterable iterable) => iterable == null || iterable.isEmpty;

bool isBlankIterable(Iterable iterable) {
  if (isEmptyIterable(iterable)) {
    return true;
  }

  for (final e in iterable) {
    if (e != null) {
      return false;
    }
  }

  return true;
}

bool equalsIterable(Iterable a, Iterable b) {
  if (a == b) {
    return true;
  } else if (a.length != b.length) {
    return false;
  }

  final iteratorA = a.iterator;
  final iteratorB = b.iterator;
  while (iteratorA.moveNext()) {
    iteratorB.moveNext();
    if (iteratorA.current != iteratorB.current) {
      return false;
    }
  }

  return true;
}

extension StringExt on String {
  /// 抹除末尾的0
  String stripTrailingZeros() {
    final pattern = RegExp(r'0+$');
    return replaceAll(pattern, '');
  }
}
