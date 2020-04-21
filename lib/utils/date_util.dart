/// 判断两个时间是否是同一天
bool isSameDay(
  int aTimeMillis,
  int bTimeMillis, {
  bool isUtc = false,
}) {
  if (aTimeMillis == null ||
      aTimeMillis == 0 ||
      bTimeMillis == null ||
      bTimeMillis == 0) {
    return false;
  }

  DateTime aDateTime =
      DateTime.fromMillisecondsSinceEpoch(aTimeMillis, isUtc: isUtc);
  DateTime bDateTime =
      DateTime.fromMillisecondsSinceEpoch(bTimeMillis, isUtc: isUtc);

  return aDateTime.year == bDateTime.year &&
      aDateTime.month == bDateTime.month &&
      aDateTime.day == bDateTime.day;
}
