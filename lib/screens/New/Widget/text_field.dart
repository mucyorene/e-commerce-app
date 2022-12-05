import 'package:flutter/material.dart';

class CustomizedField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Function(String)? onChangeFunc;
  final TextEditingController? controller;

  const CustomizedField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.controller,
      this.onChangeFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          label: Text("$labelText"),
          hintText: "$hintText",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onChanged: onChangeFunc,
    );
  }
}
