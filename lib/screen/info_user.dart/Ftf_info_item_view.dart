import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class FtfInfoItemView extends StatelessWidget {
  const FtfInfoItemView({
    Key key,
    this.title,
    this.controller,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Thiết lập ngay',
                
                contentPadding: EdgeInsets.all(14),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
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
