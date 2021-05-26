import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class UserInfoItemView extends StatelessWidget {
  const UserInfoItemView({
    Key key,
    this.title,
    this.textInfo,
  }) : super(key: key);

  final String title;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: colorTvBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              textInfo ?? 'Thiết lập ngay',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorDarkGray),
          bottom: BorderSide(color: colorDarkGray),
        ),
      ),
    );
  }
}
