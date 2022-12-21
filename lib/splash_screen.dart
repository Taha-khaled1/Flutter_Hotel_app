import 'dart:async';

import 'package:flutter/material.dart';

import 'UI/IntroApps/OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _navigator() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (_, __, ___) => onBoarding(),
        transitionDuration: const Duration(milliseconds: 2000),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        }));
  }

  /// Set timer splash
  _timer() async {
    return Timer(const Duration(milliseconds: 2300), _navigator);
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/splashScreen/splashScreen.png"),
                fit: BoxFit.cover)),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text(
              "App Name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Berlin"),
            ),
          ),
        ),
      ),
    );
  }

}

