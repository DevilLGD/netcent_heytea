import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:heytea_kit/widget/image_viewer.dart';
import 'package:heytea_kit/widget/extended_image_slide_page_route.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> _imageList;

  const GalleryScreen(this._imageList);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 250,
      child: Swiper(
        itemBuilder: _itemBuilder,
        itemCount: _imageList.length,
        onTap: (index) => _onItemTap(context, index),
        loop: false,
        scrollDirection: Axis.horizontal,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(
            bottom: 10,
            right: 12,
          ),
          builder: const FractionPaginationBuilder(),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Hero(
      tag: _imageList[index],
      child: ExtendedImage.network(
        _imageList[index],
        fit: BoxFit.cover,
      ),
    );
  }

  void _onItemTap(BuildContext context, int index) {
    Navigator.of(context).push(
      TransparentMaterialPageRoute(
        builder: (context) => ImageViewer.network(
          _imageList
              .map<ImageProvider>((s) => ExtendedNetworkImageProvider(s))
              .toList(),
          heroTagGenerator: (index) => _generateHeroTag(index),
          initialIndex: index,
        ),
      ),
    );
  }

  Object _generateHeroTag(int index) => "${this}_${index}";
}

class FractionPaginationBuilder extends SwiperPlugin {
  const FractionPaginationBuilder();

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: const BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.3),
        borderRadius: const BorderRadius.all(Radius.circular(90.0)),
      ),
      child: Text(
        "${config.activeIndex + 1}/${config.itemCount}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
