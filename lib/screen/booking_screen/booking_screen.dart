import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/booking_screen/booking_presenter.dart';
import 'package:yuru_camp/views/btn_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'view/edt_book_item_view.dart';
import 'view/item_ckin_ckout_view.dart';
import 'view/radio_item_view.dart';

/// màn hình đặt lịch
class BookingScreen extends StatefulWidget {
  const BookingScreen({Key key, this.model}) : super(key: key);

  final CampsiteModel model;

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> implements Contract {
  BookingPresenter _presenter;

  @override
  void initState() {
    _presenter = BookingPresenter(context, this);
    _presenter.campData(model: widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: _presenter.onBack,
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
        title: Text('Đặt lịch trước'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EdtBookItemView(
              title: 'Email',
              hint: 'Email',
              controller: _presenter.emailController,
            ),
            EdtBookItemView(
              title: 'Name',
              hint: 'UserName',
              controller: _presenter.nameController,
            ),
            Row(
              children: [
                RadioItemView(
                  title: 'trong ngày',
                  value: 1,
                  grpVal: _presenter.selectRadio,
                  onChanged: _presenter.onchangeDuring,
                ),
                RadioItemView(
                  title: 'qua đêm',
                  value: 2,
                  grpVal: _presenter.selectRadio,
                  onChanged: _presenter.onChangeOverNight,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: EdtBookItemView(
                    title: 'Số người',
                    hint: '5',
                    controller: _presenter.personController,
                    textType: TextInputType.number,
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                Expanded(
                  flex: 3,
                  child: EdtBookItemView(
                    title: 'Số trẻ em',
                    hint: '5',
                    controller: _presenter.chilController,
                    textType: TextInputType.number,
                  ),
                ),
              ],
            ),
            // check in date
            ItemCkInCkOutView(
              title: 'Thời gian check in dự kiến: ',
              pressDate: _presenter.ckInDate,
              dateControl: _presenter.ckinDateControl,
              pressTime: _presenter.ckInTime,
              timeControl: _presenter.ckinTimeControl,
            ),
            SizedBox(height: 16),
            //check out date
            ItemCkInCkOutView(
              title: 'Thời gian check out dự kiến: ',
              pressDate: _presenter.ckOutDate,
              dateControl: _presenter.ckoutDateControl,
              pressTime: _presenter.ckOutTime,
              timeControl: _presenter.ckoutTimeControl,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BtnItemView(
                    press: _presenter.onBack,
                    text: 'quay lại',
                    color: Colors.grey,
                  ),
                  BtnItemView(
                    press: _presenter.confirmDialog,
                    text: 'đặt lịch',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}

