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
      margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: icon,
          border: InputBorder.none,
        ),
        obscureText: typePassword,
      ),
    );
  }
}
