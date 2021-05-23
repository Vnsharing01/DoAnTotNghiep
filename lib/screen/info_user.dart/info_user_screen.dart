import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

import 'Ftf_info_item_view.dart';

class InfoUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_white.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // margin: EdgeInsets.only(bottom: 10),
              height: 264,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/manager_campsite.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/default_avatar.png',
                            width: 64,
                            height: 64,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Chiriki Higo',
                            style: TextStyle(
                              color: colorTvWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FtfInfoItemView(
                  title: 'Tên:',
                ),
                FtfInfoItemView(
                  title: 'Email:',
                ),
                FtfInfoItemView(
                  title: 'Giới tính:',
                ),
                FtfInfoItemView(
                  title: 'Số điện thoại:',
                ),FtfInfoItemView(
                  title: 'Ngày sinh:',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
