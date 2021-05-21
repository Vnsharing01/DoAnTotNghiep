import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/manager_add_campsite/mng_add_camp_screen.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_item_view.dart';

class DfMngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 36,
                    height: 36,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'abc@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              color: colorMediumGray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 136,
                    height: 136,
                  ),
                  Text(
                    'Tạo khu cắm trại của bạn trên \nYuru Camp',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  BtnItemView(
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MngAddCampScreen(),
                        ),
                      );
                    },
                    text: 'Thêm khu cắm trại',
                    color: colorPrimary,
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
