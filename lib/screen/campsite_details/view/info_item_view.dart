import 'package:flutter/material.dart';


class InfoItemView extends StatelessWidget {
  /// view thông tin khu cắm trại
  const InfoItemView({
    Key key,
    this.title,
    this.text,
  }) : super(key: key);
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ': ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              color: Colors.black87,
            ),
          )
        ]),
      ),
    );
  }
}