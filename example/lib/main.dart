import 'package:bot_toast/bot_toast.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:package_info/package_info.dart';

import 'api/api_const.dart';
import 'routes.dart';
import 'widgets/home_screen.dart';
import 'widgets/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    MyAppRoutes.defineInRouter(FluroRouter.appRouter);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appName;

  _MyAppState({String appName = ""}) {
    _appName = appName;
  }

  @override
  void initState() {
    super.initState();

    HeyTeaKit.config = HeyTeaKitConfig(
      context,
      hasSignIn: () => true,
      navigateToSignIn: (context) => HomeScreen(),
      appVersionCodeGetter: () => 1,
      apiBaseUrlsGetter: () async => [
        APIConst.gemiBaseUrl,
        APIConst.laixinBaseUrl,
      ],
      apiTokenGenerator: () async => "666666",
    );
    loadPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: SplashScreen()),
      locale: const Locale("zh", "CN"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      onGenerateRoute: FluroRouter.appRouter.generator,
      supportedLocales: [
        const Locale.fromSubtags(languageCode: "zh", countryCode: "CN"),
        const Locale.fromSubtags(languageCode: "zh", countryCode: "TW"),
        const Locale.fromSubtags(languageCode: "zh", countryCode: "HK"),
        const Locale.fromSubtags(languageCode: "zh", countryCode: "MO"),
        const Locale.fromSubtags(languageCode: "en", countryCode: "US"),
      ],
      title: _appName,
      theme: ThemeData(
        accentColor: Colors.white10,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.lightBlueAccent,
          size: 35.0,
        ),
        primaryColor: Colors.lightBlueAccent,
        textTheme: const TextTheme(
          // 设置Material的默认字体样式
          body1: TextStyle(color: Colors.white10, fontSize: 16.0),
        ),
      ),
    );
  }

  void loadPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = packageInfo.appName;
    });
  }
}
