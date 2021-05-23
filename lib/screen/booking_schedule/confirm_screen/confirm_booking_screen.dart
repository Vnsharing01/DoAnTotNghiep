import 'package:yuru_camp/screen/campsite_details/campsite_detail_screen.dart';
import 'package:yuru_camp/views/btn_item_view.dart';
import 'package:yuru_camp/views/row_info_item_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ConfirmBookingScreen extends StatelessWidget {
  const ConfirmBookingScreen({
    Key key,
    @required this.email,
    @required this.name,
    @required this.stay,
    @required this.numPerson,
    @required this.numChild,
    @required this.date,
    @required this.time,
  }) : super(key: key);
  final String email, name, stay;
  final int numPerson, numChild;
  final String date, time;
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
        title: Text('Xác nhận'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  RowInfoItemView(
                    title: 'Email',
                    text: email,
                  ),
                  RowInfoItemView(
                    title: 'Tên',
                    text: name,
                  ),
                  RowInfoItemView(
                    title: 'Lưu trú',
                    text: stay,
                  ),
                  RowInfoItemView(
                    title: 'Số người',
                    text: '$numPerson',
                  ),
                  RowInfoItemView(
                    title: 'Trẻ em',
                    text: '$numChild',
                  ),
                  RowInfoItemView(
                    title: 'Ngày',
                    text: date,
                  ),
                  RowInfoItemView(
                    title: 'Giờ',
                    text: time,
                  ),
                  RowInfoItemView(
                    title: 'Giá vé',
                    text: '${selectPrice()} vnd',
                    textColor: Colors.red,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnItemView(
                  press: () {
                    Navigator.of(context).pop();
                  },
                  text: 'quay lại',
                  color: Colors.grey,
                ),
                BtnItemView(
                  press: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Xác Nhận Đặt Lịch'),
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Không'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                  Fluttertoast.showToast(
                                    msg: 'Đặt lịch thành công',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                },
                                child: Text('Xác Nhận'),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  text: 'Đặt Lịch',
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// tính giá vé vào cổng
  int selectPrice() {
    int price = 0;
    price = numPerson * 100000 - numChild * 50000;
    return price;
  }
}
