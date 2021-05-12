import 'package:yuru_camp/views/row_info_item_view.dart';
import 'package:flutter/material.dart';

class HisDetailsScreen extends StatelessWidget {
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
        title: Text('ABC Camp'),
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
              text: '09-05-2021',
            ),
            RowInfoItemView(
              title: 'Giờ',
              text: '08:30 AM',
            ),
            RowInfoItemView(
              title: 'Lưu trú',
              text: 'qua đêm',
            ),
            RowInfoItemView(
              title: 'Số người',
              text: '5',
            ),
            RowInfoItemView(
              title: 'Trẻ em',
              text: '2',
            ),
            RowInfoItemView(
              title: 'Giá vé',
              text: '400000 vnd',
            ),
          ],
        ),
      ),
    );
  }
}
