import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(children: [
        Positioned(
          left: -90,
          top: 120,
          child: Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: Colors.amber, shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: 80,
          child: Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          left: 140,
          top: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 50.0, sigmaY: 40.0, tileMode: TileMode.clamp),
          child: Container(
            height: 255,
          ),
        )
      ]),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) => context.go("/home"));
    super.initState();
  }
}
