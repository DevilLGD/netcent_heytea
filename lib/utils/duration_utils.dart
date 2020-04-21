import 'package:heytea_kit/utils/number_utils.dart';

extension DurationExtension on Duration {
  String toMinuteSecondString() {
    if (inMicroseconds < 0) {
      return "-00:00";
    }
    String twoDigitMinutes =
        NumberUtils.twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        NumberUtils.twoDigits(inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
