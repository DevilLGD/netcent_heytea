import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/utils/duration_utils.dart';
import 'package:heytea_kit/utils/video_player_utils.dart';
import 'package:video_player/video_player.dart';

class HeyTeaVideoPlayerRoute extends CupertinoPageRoute {
  HeyTeaVideoPlayerRoute({@required WidgetBuilder builder})
      : super(builder: builder);
}

class HeyTeaVideoPlayer extends StatefulWidget {
  final VideoPlayerController _controller;

  const HeyTeaVideoPlayer(this._controller);

  @override
  State<StatefulWidget> createState() {
    return _HeyTeaVideoPlayerState();
  }
}

class _HeyTeaVideoPlayerState extends State<HeyTeaVideoPlayer>
    with WidgetsBindingObserver {
  VideoPlayerController get _controller => widget._controller;

  Widget _gestureDetector;
  Widget _playButton;
  Widget _overlayUI;

  bool _isOverlayUIShow = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _controller.addListener(() => setState(() {}));
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized,
      // even before the play button has been pressed.
      _controller.play();
    });

    _gestureDetector = SizedBox.expand(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isOverlayUIShow = !_isOverlayUIShow;
          });
        },
      ),
    );
    _playButton = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        width: 48,
        height: 48,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
      ),
      onTap: () => _controller.switchPlayState(),
    );
    _overlayUI = _HeyTeaVideoPlayerOverlay(_controller);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        if (_controller.value.isPlaying) {
          _controller.pause();
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const SizedBox.shrink(),
          _gestureDetector,
          Visibility(
            visible: _controller.value.initialized &&
                _controller.value.isPlaying == false,
            child: _playButton,
          ),
          Visibility(
            visible: _isOverlayUIShow,
            child: _overlayUI,
          ),
          _controller.value.initialized || _controller.value.hasError
              ? const SizedBox.shrink()
              : CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Colors.white.withOpacity(0.3)),
                  strokeWidth: 2.0,
                ),
          _controller.value.hasError
              ? Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    _controller.value.errorDescription,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _HeyTeaVideoPlayerOverlay extends StatefulWidget {
  final VideoPlayerController _controller;

  _HeyTeaVideoPlayerOverlay(this._controller);

  @override
  State<StatefulWidget> createState() {
    return _HeyTeaVideoPlayerOverlayState();
  }
}

class _HeyTeaVideoPlayerOverlayState extends State<_HeyTeaVideoPlayerOverlay> {
  static const _iconSize = 24.0;
  static const _iconColor = Colors.white;

  VideoPlayerController get _controller => widget._controller;

  @override
  void initState() {
    super.initState();

    _controller.addListener(_onControllerUpdated);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.removeListener(_onControllerUpdated);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    _controller.value.isPlaying
                        ? CupertinoIcons.pause_solid
                        : CupertinoIcons.play_arrow_solid,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                  onTap: () => _controller.switchPlayState(),
                ),
                const SizedBox(width: 10),
                Text(
                  _formatDuration(_controller.value.position),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 1,
                      activeTrackColor: Colors.white.withOpacity(0.8),
                      inactiveTrackColor: Colors.white.withOpacity(0.4),
                      thumbColor: Colors.white,
                      overlayColor: Colors.transparent,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 8),
                    ),
                    child: Slider(
                      value: _controller.value.position.inSeconds.toDouble(),
                      onChanged: _onSliderValueUpdated,
                      max: _controller.value.duration.inSeconds.toDouble(),
                    ),
                  ),
                ),
                Text(
                  _formatDuration(_controller.value.duration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: const Icon(
                CupertinoIcons.clear_thick,
                size: _iconSize,
                color: _iconColor,
              ),
              onTap: () => HeyTeaKit.popRoute(context),
            ),
          ],
        ),
      ),
    );
  }

  _onControllerUpdated() {
    setState(() {});
  }

  _onSliderValueUpdated(double value) {
    if (_controller.value.initialized == false) {
      return;
    }

    final valueInInt = value.toInt();
    if (_controller.value.position.inSeconds != valueInInt) {
      _controller.seekTo(Duration(seconds: valueInInt));
    }
  }

  String _formatDuration(Duration duration) {
    final fDuration = duration != null ? duration : Duration.zero;
    return fDuration.toMinuteSecondString();
  }
}
