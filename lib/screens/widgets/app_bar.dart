import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  const CommonAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(elevation: 0.0, centerTitle: true, title: Text("$title"));
  }
}
