import 'dart:io';

import 'package:clothes_app_starter/screens/Home/widget/home_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory path = await path_provider.getTemporaryDirectory();
  Hive.init(path.path);
  runApp(Products());
}

class Products extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Product L App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: routers.routeInformationParser,
      routerDelegate: routers.routerDelegate,
      routeInformationProvider: routers.routeInformationProvider,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          HomeScreenWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
