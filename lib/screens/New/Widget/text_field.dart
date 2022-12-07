import 'package:flutter/material.dart';

class CustomizedField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Icon? suffixIcon;
  final Function()? onTapFunc;
  final Function(String)? onChangeFunc;
  final bool? enable;
  final TextEditingController? controller;

  const CustomizedField(
      {Key? key,
      this.hintText,
      this.enable = true,
      this.labelText,
      this.suffixIcon,
      this.onTapFunc,
      this.controller,
      this.onChangeFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapFunc,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text("${labelText ?? ""}"),
          hintText: "$hintText",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          enabled: enable == true ? true : false),
      onChanged: onChangeFunc,
    );
  }
}
