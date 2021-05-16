import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/manager_default/mng_df_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class MngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
      ),
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
          Expanded(flex: 8, child: DfMngCampScreen()),
        ],
      ),
    );
  }
}
