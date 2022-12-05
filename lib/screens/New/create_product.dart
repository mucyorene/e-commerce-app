import 'package:clothes_app_starter/screens/New/Widget/text_field.dart';
import 'package:clothes_app_starter/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  get formKey => null;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(title: "Create an item"),
          preferredSize: Size(60, 60)),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomizedField(
                    hintText: "Enter item name",
                    labelText: "Item Name",
                    controller: nameController,
                    onChangeFunc: (s) {
                      print("This is the name: ${nameController.text}");
                    },
                  )
                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            child: ElevatedButton(
              onPressed: () => context.go("/home"),
              child: Text("Add"),
            ),
          )),
    );
  }
}
