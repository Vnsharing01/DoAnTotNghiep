import 'package:flutter/material.dart';

class BtnItemView extends StatelessWidget {
  /// custom button widget
  const BtnItemView({
    Key key,
    @required this.press,
    @required this.text,
    this.color,
    this.margin,
  }) : super(key: key);
  final Function press;
  final String text;
  final Color color;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
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
