import 'package:flutter/material.dart';

class DateTimeEdtItemView extends StatelessWidget {
  const DateTimeEdtItemView({
    Key key,
    @required this.controller,
    @required this.title,
    this.hint,
    @required this.press,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hint;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
      ],
    );
  }
}
