import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heytea_kit/http/dior.dart';
import 'package:heytea_kit/logger.dart';
import 'package:heytea_kit/toast.dart';
import 'package:heytea_kit/widget/video_player.dart';
//import 'package:heytea_kit_example/api/laixin_client.dart';
//import 'package:heytea_kit_example/entity/opening_ad_entity.dart';
import 'package:heytea_kit_example/routes.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              child: const Text("Navigation"),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, MyAppRoutes.home),
            ),
            CupertinoButton(
              child: const Text("Gallery"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyAppRoutes.gallery),
            ),
            CupertinoButton(
              child: const Text("VideoPlayer"),
              onPressed: () => Navigator.of(context).push(
                HeyTeaVideoPlayerRoute(
                    builder: (context) => HeyTeaVideoPlayer(
                          VideoPlayerController.network(
                              "https://v-cdn.zjol.com.cn/280443.mp4"),
                        )),
              ),
            ),
            CupertinoButton(
              child: const Text("ShowText"),
              onPressed: () => HeyTeaToast.showIconText(
                "Hello World",
                widgetBuilder: (context) => Image.network(
                    "https://csdnimg.cn/cdn/content-toolbar/csdn-logo_.png"),
              ),
            ),
            CupertinoButton(
              child: const Text("ShowLoading"),
              onPressed: () => HeyTeaToast.showLoading(null),
            ),
            CupertinoButton(
              child: const Text("ShowLoadingText"),
              onPressed: () => HeyTeaToast.showLoading("稍等一下"),
            ),
            CupertinoButton(
              child: const Text("ShowSuccess"),
              onPressed: () => HeyTeaToast.showSuccess("加载成功"),
            ),
            CupertinoButton(
              child: const Text("ShowFailure"),
              onPressed: () => HeyTeaToast.showFailure("加载失败"),
            ),
            CupertinoButton(
              child: const Text("Retrofit"),
              onPressed: () {
                // 显示Loading，收到一个CancelFunc实例
//                final cancelLoading = HeyTeaToast.showLoading("正在请求");
//                LaixinClient.shared()
//                    .openingAd(5)
//                    .then(Dior.verifyResponse)
//                    .then((response) => OpeningAdEntity.fromJson(response.data))
//                    .then((data) {
//                      HeyTeaLogger().d(data.adGroupName);
//                      HeyTeaToast.showIconText(data.adGroupName);
//                    })
//                    .catchError(Dior.handleError)
//                    // 结束时关闭Loading
//                    .whenComplete(cancelLoading);
              },
            ),
          ],
        ),
      ),
    );
  }
}
