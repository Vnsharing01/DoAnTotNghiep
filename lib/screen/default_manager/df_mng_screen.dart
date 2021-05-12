import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_item_view.dart';

class DfMngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100),
        alignment: Alignment.center,
        color: colorMediumGray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 150,
              height: 150,
            ),
            Text(
              'Tạo khu cắm trại của bạn trên \nYuru Camp',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            BtnItemView(
              press: () {},
              text: 'Thêm khu cắm trại',
              color: colorPrimary,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
