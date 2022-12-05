import 'package:clothes_app_starter/screens/Home/widget/home_screen_widget.dart';
import 'package:clothes_app_starter/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: CommonAppBar(title: "Products"),
            preferredSize: Size(60, 60)),
        body: HomeScreenWidget(),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0, shape: CircleBorder(), padding: EdgeInsets.all(15)),
          onPressed: () => context.push("/create"),
          child: Text(
            "+",
            style: TextStyle(fontSize: 25),
          ),
        ));
  }
}
