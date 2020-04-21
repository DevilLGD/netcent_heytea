import 'package:video_player/video_player.dart';

extension VideoPlayerControllerExtension on VideoPlayerController {
  switchPlayState() {
    if (value.isPlaying) {
      pause();
    } else if (value.position == value.duration) {
      seekTo(Duration.zero).then((_) {
        play();
      });
    } else {
      play();
    }
  }
}
