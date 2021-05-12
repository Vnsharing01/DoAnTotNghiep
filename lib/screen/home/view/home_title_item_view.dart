import 'package:flutter/material.dart';

/// title and see more 
class HomeTitleMoreItemView extends StatelessWidget {
  const HomeTitleMoreItemView({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              'Xem thêm',
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}