import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  List<String> clothesList = [
    "assets/images/arrival1.png",
    "assets/images/arrival2.png",
    "assets/images/detail3.png",
    "assets/images/arrival2.png",
    "assets/images/detail3.png",
    "assets/images/arrival1.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                childAspectRatio: 16 / 9),
            children: clothesList
                .map((e) => Column(
                      children: [
                        Container(
                          child: Expanded(
                            child: Card(
                              elevation: 0,
                              child: Image.asset(
                                e,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text("Product ${e.hashCode}")
                      ],
                    ))
                .toList(),
          ),
        ));
  }
}
