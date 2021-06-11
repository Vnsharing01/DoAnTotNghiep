import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/row_info_item_view.dart';

class UserBookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          'Chi tiết đặt lịch ',
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
      body: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            RowInfoItemView(
              title: 'Ngày đặt lịch ',
              text: '20/05/2021',
            ),
            RowInfoItemView(
              title: 'Tên',
              text: 'Chiriki Higo',
            ),
            RowInfoItemView(
              title: 'Email',
              text: 'Higo@gmail.com',
            ),
            RowInfoItemView(
              title: 'Số người ',
              text: '5',
            ),
            RowInfoItemView(
              title: 'Trẻ em ',
              text: '2',
            ),
            RowInfoItemView(
              title: 'Lưu trú ',
              text: 'qua đêm',
            ),
            RowInfoItemView(
              title: 'Ngày hẹn ',
              text: '30/05/2021',
            ),
            RowInfoItemView(
              title: 'Thời gian ',
              text: '08:30 AM',
            ),
            RowInfoItemView(
              title: 'Giá vé ',
              text: '400000 vnd',
              textColor: Colors.red,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
