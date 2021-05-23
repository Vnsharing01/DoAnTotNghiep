import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/booking_details/booking_details_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class BookingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorWhite,
          title: Text(
            'Danh sách đặt lịch',
            style: TextStyle(
              color: colorTvBlack,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Image.asset('assets/icons/ic_back_black.png'),
          ),
        ),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('20/05/2021'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chiriki higo',
                          style: TextStyle(
                            color: colorTvBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Qua đêm',
                          style: TextStyle(
                            color: colorTvMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: colorDarkGray),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
