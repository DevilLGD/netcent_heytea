import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef HeroTagGenerator = Object Function(int index);

class ImageViewer {
  static network(
    List<ImageProvider> imageProviders, {
    required HeroTagGenerator heroTagGenerator,
    int initialIndex = 0,
  }) {
    return ExtendedImageSlidePage(
      child: ImageViewerPageView(
        imageProviders,
        heroTagGenerator: heroTagGenerator,
        initialIndex: initialIndex,
      ),
      slideAxis: SlideAxis.both,
      slideType: SlideType.onlyImage,
    );
  }
}

class ImageViewerPageView extends StatelessWidget {
  final List<ImageProvider> _imageProviders;
  final HeroTagGenerator heroTagGenerator;
  final int initialIndex;

  int _currentIndex = 0;

  ImageViewerPageView(
    this._imageProviders, {
    required this.heroTagGenerator,
    this.initialIndex = 0,
  }) {
    _currentIndex = initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ExtendedImageGesturePageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(
          initialPage: initialIndex,
        ),
        onPageChanged: (int index) {
          _currentIndex = index;
        },
        itemBuilder: (BuildContext context, int index) {
          Widget image = ExtendedImage(
            image: _imageProviders[index],
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) => GestureConfig(
              inPageView: true,
              initialScale: 1.0,
              cacheGesture: false,
            ),
            enableSlideOutPage: true,
          );
          image = Container(
            child: image,
            padding: EdgeInsets.all(5.0),
          );
          if (index == _currentIndex) {
            return Hero(
              tag: heroTagGenerator(index),
              child: image,
            );
          } else {
            return image;
          }
        },
        itemCount: _imageProviders.length,
      ),
    );
  }
}
