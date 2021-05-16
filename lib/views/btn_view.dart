import 'package:flutter/material.dart';

class BtnView extends StatelessWidget {
  final Function press;
  final String text;
  final Color color;
  final EdgeInsetsGeometry  margin;

  const BtnView({
    Key key,
    @required this.press,
    @required this.text,
    this.color, 
    this.margin,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
