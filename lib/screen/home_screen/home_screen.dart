import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/history/history_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yuru_camp/screen/home_screen/home_presenter.dart';

import 'view/home_title_item_view.dart';

final banner = [
  'assets/images/banrom_banner.jpg',
  'assets/images/bavi_banner.jpg',
  'assets/images/cam_trai_dong_mo_1.jpg',
  'assets/images/tamdao.jpg',
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  implements Contract {
  HomePresenter _presenter;

  @override
  void initState() {
    _presenter = HomePresenter(context, this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                // banner vể hoạt động cắm trại or sự kiện mới/ gần nhất của các khu cắm trại
                width: double.infinity,
                height: 240,
                color: Colors.redAccent,
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 4000,
                  control: SwiperControl(),
                  itemCount: banner.length,
                  itemBuilder: (context, index) {
                    return Image(
                      image: AssetImage(banner[index]),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              HomeTitleMoreItemView(
                title: 'Lịch sử gần nhất',
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ),
                  );
                },
              ),
              Container(
                // list khu cắm trại đã đặt lịch gần nhất
                color: Colors.grey[350],
                height: 164,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GestureDetector(
                  onTap: _presenter.showAllHistory,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 4),
                            blurRadius: 5,
                          ),
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            child: Image(
                              image: AssetImage('assets/images/nhathodo.jpg'),
                              fit: BoxFit.cover,
                              width: 100,
                              height: double.infinity,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vườn quốc gia Ba Vì',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Nội dung giới thiệu khu cắm trại',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              HomeTitleMoreItemView(
                title: 'Một số khu cắm trại',
                press: _presenter.showAllCampsite,
              ),
              Container(
                width: double.infinity,
                height: 550,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: _presenter.showCampsite(),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: 36,
            height: 36,
          ),
          Text('Yuru Camp'),
        ],
      ),
      centerTitle: true,
      leading: Container(),
      actions: [
        SizedBox(width: 50),
      ],
    );
  }

  @override
  void updateSate() {
    setState(() {
      
    });
  }
}

