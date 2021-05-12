import 'package:flutter/material.dart';

class TextFeildView extends StatelessWidget {
  const TextFeildView({
    Key key,
    @required this.controller,
    @required this.hintText,
    this.icon,
    this.typePassword = false,
  }) : super(key: key);

  final TextEditingController controller;

  final String hintText;
  final Icon icon;
  final bool typePassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: icon,
          border: InputBorder.none,
        ),
        maxLines: 1,
        obscureText: typePassword,
      ),
    );
  }
}
