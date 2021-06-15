import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/styles/styles.dart';
import 'package:yuru_camp/views/row_info_item_view.dart';

/// màn chi tiết lịch đặt của khách
class UserBookDetailsScreen extends StatelessWidget {
  const UserBookDetailsScreen({Key key, this.model}) : super(key: key);

  final BookingModel model;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd-MM-yyyy -');
    String dateTime = formatter.add_jm().format(model.createDate.toDate());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          'Chi tiết đặt lịch ',
          style: Styles.copyStyle(
            color: colorTvBlack,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () => Navigator.of(context).pop(),
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
              text: dateTime ?? '-----',
            ),
            RowInfoItemView(
              title: 'Tên',
              text: model?.userName ?? '-----',
            ),
            RowInfoItemView(
              title: 'Email',
              text: model?.email ?? '-----',
            ),
            RowInfoItemView(
              title: 'Số người ',
              text: model?.people.toString() ?? '-----',
            ),
            RowInfoItemView(
              title: 'Trẻ em ',
              text: model?.children.toString() ?? '-----',
            ),
            RowInfoItemView(
              title: 'Lưu trú ',
              text: model?.stay ?? '-----',
            ),
            RowInfoItemView(
              title: 'Ngày hẹn ',
              text: model?.checkinDate ?? '-----',
            ),
            RowInfoItemView(
              title: 'Thời gian ',
              text: model?.checkinTime ?? '-----',
            ),
            RowInfoItemView(
              title: 'Giá vé ',
              text: model?.price.toString() ?? '-----',
              textColor: Colors.red,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
