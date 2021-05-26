import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/booking_list/booking_list_screen.dart';
import 'package:yuru_camp/screen/manager_edit_camp_info/edit_camp_info_screen.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'Content_info_item_view.dart';

  /// màn hình khi có khu cắm trại 
class MngYourCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image(
                      image: AssetImage('assets/images/default_avatar.png'),
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABC Camp',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('Abc def'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Khách đặt lịch  ',
                          style: TextStyle(
                            color: colorTvMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '(4)',
                          style: TextStyle(
                            color: colorTvRed,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookingListScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Danh Sách ',
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: colorDarkGray,
                  ),
                  bottom: BorderSide(
                    color: colorDarkGray,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              child: Text(
                'Thông tin khu cắm trại',
                style: TextStyle(
                  color: colorTvMain,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: colorDarkGray,
                  ),
                  bottom: BorderSide(
                    color: colorDarkGray,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Ảnh',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: buildImage(image: 'assets/images/tamdao.jpg'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child:
                            buildImage(image: 'assets/images/bavi_banner.jpg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: buildImage(
                            image: 'assets/images/banrom_banner.jpg'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: buildImage(
                            image: 'assets/images/dongmo_banner.jpg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Thông tin địa chỉ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _infoAddressText(title: 'Địa Chỉ: ', text: 'abc,xyz,ghj'),
                  _infoAddressText(title: 'Hotline: ', text: '0123456789'),
                  _infoAddressText(title: 'Email: ', text: 'abc@camp.vn'),
                  _infoAddressText(title: 'Fanpage: ', text: 'fb/abccamp.vn'),
                  _infoAddressText(title: 'Website: ', text: 'AbcCamp.vn'),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: colorDarkGray,
                  ),
                  bottom: BorderSide(
                    color: colorDarkGray,
                  ),
                ),
              ),
            ),
            ContentInfoItemView(
              title: 'Giới thiệu',
              contentText:
                  'sdfghjkasdfghjksdfghjklasdfghjkasdfghjkqwerqwsdfvbnweugdcbhnawidahjnowaisbjklciub asdvtybwiueayi uawv yaiudhoieweoirybwcwneirtbwexniq',
            ),
            ContentInfoItemView(
              title: 'Thông tin dịch vụ',
              contentText:
                  'sdfghjkasdfghjksdfghjklasdfghjkasdfghjkqwerqwsdfvbnweugdcbhnawidahjnowaisbjklciub',
            ),
            Container(
              margin: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BtnView(
                      press: () {
                        
                      },
                      text: 'xóa khu cắm trại',
                      color: colorDarkGray,
                      textColor: colorTvBlack,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BtnView(
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contexxt) => EditCampInfo(),
                          ),
                        );
                      },
                      text: 'Chỉnh sửa nội dung',
                      color: colorPrimary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText _infoAddressText({String title, String text}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: colorTvBlack,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        TextSpan(
          text: text,
          style: TextStyle(
            color: colorTvMain,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }

  Container buildImage({String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          width: double.infinity,
          height: 130,
          fit: BoxFit.cover,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
