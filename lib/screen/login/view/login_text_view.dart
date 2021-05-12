import 'package:flutter/material.dart';

class LoginTextView extends StatelessWidget {
  const LoginTextView({
    Key key,
    @required this.text,
    this.align,
    this.color,
    @required this.press,
  }) : super(key: key);

  final String text;
  final TextAlign align;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: press,
        child: Text(
          text,
          textAlign: align,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ),
    );
  }
}
