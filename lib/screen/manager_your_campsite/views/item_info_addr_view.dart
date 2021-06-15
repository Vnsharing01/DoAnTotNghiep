import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/styles/styles.dart';

class ItemInfoAddressView extends StatelessWidget {
  const ItemInfoAddressView({
    Key key, this.title, this.text,
  }) : super(key: key);
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: Styles.copyStyle(
            color: colorTvBlack,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: text,
          style: Styles.copyStyle(),
        ),
      ]),
    );
  }
}
