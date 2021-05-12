import 'package:yuru_camp/screen/booking_schedule/booking_screen/booking_screen.dart';
import 'package:yuru_camp/screen/map/map_direct_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../views/btn_item_view.dart';
import 'view/info_item_view.dart';
import 'view/title_item_view.dart';

final banner = [
  'assets/images/cam_trai_dong_mo_1.jpg',
  'assets/images/cam_trai_dong_mo_2.jpg',
  'assets/images/cam_trai_dong_mo_3.jpg',
];
int position = 0;

class CampsiteDetailScreen extends StatefulWidget {
  @override
  _CampsiteDetailScreenState createState() => _CampsiteDetailScreenState();
}

class _CampsiteDetailScreenState extends State<CampsiteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_white.png'),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: buildBanner(),
                ),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 80),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Khu cắm trại Đồng Mô',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          InfoItemView(
                            title: 'Địa chỉ',
                            text: 'Sơn Đông, Sơn Tây, Hà Nội',
                          ),
                          InfoItemView(
                            title: 'Hotline',
                            text: '0908353377',
                          ),
                          InfoItemView(
                            title: 'Fanpage',
                            text: 'fb/camtraidongmo ',
                          ),
                          InfoItemView(
                            title: 'Email',
                            text: 'sale@campingsport.vn',
                          ),
                          InfoItemView(
                            title: 'Website',
                            text: 'CampingSport.vn',
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TitleItemView(title: 'Giới thiệu'),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    ' Camping Sport Đồng Mô sở hữu cho mình 3,9 ha với địa hình lý tưởng với tổ hợp rừng, núi, hồ nước, không gian xanh mát, không khí trong lành rất thích hợp cho các hoạt động dã ngoại cắm trại, vui chơi, vận động, trải nghiệm, thử thách giới hạn của bản thân nhưng cũng hết sức thư giãn, xả stress hiệu quả.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                TitleItemView(title: 'Dịch vụ'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '100000',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'vnd/ng',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        BtnItemView(
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BookingScreen(),
                              ),
                            );
                          },
                          text: 'đặt lịch',
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        BtnItemView(
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MapDirectScreen(),
                              ),
                            );
                          },
                          text: 'chỉ đường',
                          color: Colors.green,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack buildBanner() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Swiper(
            autoplay: true,
            autoplayDelay: 3000,
            onIndexChanged: (value) {
              setState(() {
                if (value > banner.length) {
                  value = 0;
                  return position = value;
                } else {
                  position = value;
                  return position;
                }
              });
            },
            itemCount: banner.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  banner[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: DotsIndicator(
              dotsCount: banner.length,
              position: position.toDouble(),
              decorator: DotsDecorator(
                activeColor: Colors.orange,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
