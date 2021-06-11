import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/booking_screen/booking_screen.dart';
import 'package:yuru_camp/screen/campsite_map/campsite_map_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../views/btn_item_view.dart';
import 'view/info_item_view.dart';
import 'view/title_item_view.dart';

class CampsiteDetailScreen extends StatefulWidget {
  const CampsiteDetailScreen({
    Key key,
    this.model,
  }) : super(key: key);

  final CampsiteModel model;

  @override
  _CampsiteDetailScreenState createState() => _CampsiteDetailScreenState();
}

class _CampsiteDetailScreenState extends State<CampsiteDetailScreen> {
  int position = 0;
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
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.campName ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          InfoItemView(
                            title: 'Địa chỉ',
                            text: widget.model.address ?? '',
                          ),
                          InfoItemView(
                            title: 'Hotline',
                            text: widget.model.hotline.toString() ?? '',
                          ),
                          InfoItemView(
                            title: 'Fanpage',
                            text: widget.model.fanpage ?? '',
                          ),
                          InfoItemView(
                            title: 'Email',
                            text: widget.model.email ?? '',
                          ),
                          InfoItemView(
                            title: 'Website',
                            text: widget.model.web ?? '',
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
                                    widget.model.intro ?? '',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                TitleItemView(title: 'Dịch vụ'),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    widget.model.service ?? '',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
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
                          text: widget.model.personPrice.toString() ?? '100000',
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
                                builder: (context) =>
                                    BookingScreen(model: widget.model),
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
                                builder: (context) =>
                                    CampsiteMapScreen(model: widget.model),
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
                if (value > widget.model.images.length || value == 0) {
                  value = 0;
                  return position = value;
                } else {
                  position = value;
                  return position;
                }
              });
            },
            itemCount: widget.model.images.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.network(
                  widget.model.images[index],
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
              dotsCount: widget.model.images.length,
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
