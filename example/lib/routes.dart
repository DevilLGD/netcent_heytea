import 'package:fluro/fluro.dart';
import 'package:heytea_kit/router.dart';
import 'package:heytea_kit_example/widgets/gallery_screen.dart';
import 'package:heytea_kit_example/widgets/home_screen.dart';

import 'widgets/splash_screen.dart';

class MyAppRoutes {
  static const TransitionType _transitionType = TransitionType.cupertino;

  static const String splash = '/splash';
  static const String home = "/home";
  static const String gallery = "/gallery";

  static defineInRouter(FluroRouter router) {
    router.define(
      splash,
      handler: HeyTeaRouter.handlerOf(
        (context, parameters) => SplashScreen(),
      ),
      transitionType: _transitionType,
    );
    router.define(
      home,
      handler: HeyTeaRouter.handlerOf(
        (context, parameters) => HomeScreen(),
        requireSignIn: true,
      ),
      transitionType: _transitionType,
    );
    router.define(
      gallery,
      handler: HeyTeaRouter.handlerOf(
        (context, parameters) => GalleryScreen([
          "https://www.splitshire.com/wp-content/uploads/2016/02/SplitShire-2851.jpg",
          "https://pic.36krcnd.com/avatar/201712/19082638/3cmf5bqmm6aowdos.jpg",
          "https://pic1.zhimg.com/v2-3b4fc7e3a1195a081d0259246c38debc_1200x500.jpg",
        ]),
        requireSignIn: true,
      ),
      transitionType: _transitionType,
    );
  }
}
