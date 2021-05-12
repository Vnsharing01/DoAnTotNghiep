import 'package:yuru_camp/styles/color.dart';
import 'package:flutter/material.dart';

class RowInfoItemView extends StatelessWidget {
  const RowInfoItemView({
    Key key,
    this.title,
    this.text,
    this.textColor,
    this.weight,
  }) : super(key: key);

  final String title, text;
  final Color textColor;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: colorDarkGray,
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(
              text,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: weight,
              ),
            ),
            decoration: BoxDecoration(
              color: colorLightGray,
              border: Border(
                left: BorderSide(color: Colors.white),
                top: BorderSide(color: Colors.white),
                right: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
