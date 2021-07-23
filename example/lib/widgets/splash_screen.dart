import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _alreadySignIn = false;

  @override
  void initState() {
    super.initState();

    _nextRoute();
  }

  @override
  Widget build(BuildContext context) {
    switch (_alreadySignIn) {
      case false:
        // TODO 返回登录页
        return HeyTeaKit.config!.navigateToSignIn(context);
      case true:
        return HomeScreen();
      default:
        return SpinKitPulse(color: Colors.blueGrey);
    }
  }

  _nextRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.get('user') ?? 0;
    setState(() {
      _alreadySignIn = user != null;
    });
  }
}
