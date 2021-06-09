import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/views/row_info_item_view.dart';
import 'package:flutter/material.dart';

class HisDetailsScreen extends StatelessWidget {
  const HisDetailsScreen({
    Key key,
    this.model,
  }) : super(key: key);

  final BookingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
        title: Text(model.campName),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 25),
                child: Text(
                  'Lịch sử chi tiết',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            RowInfoItemView(
              title: 'Ngày',
              text: model.checkinDate ?? '',
            ),
            RowInfoItemView(
              title: 'Giờ',
              text: model.checkinTime ?? '',
            ),
            RowInfoItemView(
              title: 'Lưu trú',
              text: model.stay ?? '',
            ),
            RowInfoItemView(
              title: 'Số người',
              text: model.people.toString() ?? '',
            ),
            RowInfoItemView(
              title: 'Trẻ em',
              text: model.children.toString() ?? '',
            ),
            RowInfoItemView(
              title: 'Giá vé',
              text: '${model.price} vnd' ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
