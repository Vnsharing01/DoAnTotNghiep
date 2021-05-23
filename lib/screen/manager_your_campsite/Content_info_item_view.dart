import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class ContentInfoItemView extends StatelessWidget {
  const ContentInfoItemView({
    Key key,
    @required this.title,
    @required this.contentText,
  }) : super(key: key);
  final String title;
  final String contentText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                color: colorTvBlack,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Text(contentText),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorDarkGray,
          ),
        ),
      ),
    );
  }
}
