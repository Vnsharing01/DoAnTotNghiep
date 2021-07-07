import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/styles/styles.dart';

class BookingPresenter extends Presenter {
  BookingPresenter(BuildContext context, Contract view) : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('booking');

  // text controller
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final personController = TextEditingController();
  final chilController = TextEditingController();
  final ckinDateControl = TextEditingController();
  final ckinTimeControl = TextEditingController();
  final ckoutDateControl = TextEditingController();
  final ckoutTimeControl = TextEditingController();

// btn radio
  int selectRadio;
  String titlRadio;

// date
  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat('dd-MM-yyyy');

  // time
  String _hour, _minute, _time;
  TimeOfDay selectTime = TimeOfDay(hour: 00, minute: 00);

  int _price;

  CampsiteModel _campModel;

  @override
  void init() {
    selectRadio = 0;
    titlRadio = '';

    _price = 0;
    emailController.text = inputData().email;
    personController.text = '1';
    chilController.text = '0';
    ckinDateControl.text = df.format(selectedDate);
    ckinTimeControl.text =
        formatDate(selectedDate, [hh, ':', nn, ' ', am]).toString();
    super.init();
  }

  CampsiteModel campData({CampsiteModel model}) {
    return _campModel = CampsiteModel(
      campName: model.campName,
      email: model.email,
      address: model.address,
      area: model.area,
      hotline: model.hotline,
      fanpage: model.fanpage,
      web: model.web,
      intro: model.intro,
      service: model.service,
      personPrice: model.personPrice,
      childPrice: model.childPrice,
      latitude: model.latitude,
      longitude: model.longitude,
      images: model.images,
    );
  }

  setSelectRadio(int val) {
    selectRadio = val;
    view.updateSate();
  }

  int setupdatePrice() {
    _price = _campModel.childPrice == 0
        ? (int.parse(personController.text) * _campModel.personPrice)
        : (int.parse(personController.text) * _campModel.personPrice) -
            (int.parse(chilController.text) *
                (_campModel.personPrice - _campModel.childPrice));
    return _price;
  }

  // check radio button //
  onchangeDuring(val) {
    setSelectRadio(val);
    titlRadio = 'trong ngày';
  }

  onChangeOverNight(val) {
    setSelectRadio(val);
    titlRadio = 'qua đêm';
  }

  /// show and tick date - BuildContext context
  /// ck in date
  Future ckInDate() async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      selectedDate = picker;
      ckinDateControl.text = df.format(selectedDate);
      view.updateSate();
    }
  }

  /// ck out date
  Future ckOutDate() async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      selectedDate = picker;
      ckoutDateControl.text = df.format(selectedDate);
      view.updateSate();
    }
  }

  /// show and tick time - BuildContext context
  /// ck in time
  Future ckInTime() async {
    final TimeOfDay picker = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (picker != null) {
      selectTime = picker;
      _hour = selectTime.hour.toString();
      _minute = selectTime.minute.toString();
      _time = _hour + ' : ' + _minute;
      ckinTimeControl.text = _time;
      ckinTimeControl.text = formatDate(
          DateTime(2000, 1, 1, selectTime.hour, selectTime.minute),
          [hh, ':', nn, ' ', am]).toString();
      view.updateSate();
    }
  }

  /// ck out time
  Future ckOutTime() async {
    final TimeOfDay picker = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (picker != null) {
      selectTime = picker;
      _hour = selectTime.hour.toString();
      _minute = selectTime.minute.toString();
      _time = _hour + ' : ' + _minute;
      ckoutTimeControl.text = _time;
      ckoutTimeControl.text = formatDate(
          DateTime(2000, 1, 1, selectTime.hour, selectTime.minute),
          [hh, ':', nn, ' ', am]).toString();
      view.updateSate();
    }
  }

  /// thêm booking mới
  /// TODO: thêm 2 trường check out date-time
  void addBooking() {
    try {
      createBooking(
        campName: _campModel.campName,
        imageUrl: _campModel.images.first,
        email: emailController.text,
        userName: nameController.text,
        stay: titlRadio,
        people: int.tryParse(personController.text),
        children: int.tryParse(chilController.text),
        checkinDate: ckinDateControl.text,
        checkinTime: ckinTimeControl.text,
        checkoutDate: ckoutDateControl.text,
        checkoutTime: ckoutTimeControl.text,
        createDate: Timestamp.fromDate(DateTime.now()),
        price: setupdatePrice(),
      );
      Navigator.of(context).pop(true);
    } catch (e, stack) {
      view.updateSate();
      debugPrint('$e, $stack');
    }
  }

  void createBooking({
    String email,
    String userName,
    String campName,
    Timestamp createDate,
    int people,
    int children,
    int price,
    String stay,
    String checkinDate,
    String checkinTime,
    String checkoutDate,
    String checkoutTime,
    String imageUrl,
  }) async {
    await ref.doc().set({
      'email': email,
      'user_name': userName,
      'camp_name': campName,
      'create_date': createDate,
      'people': people,
      'children': children,
      'price': price,
      'stay': stay,
      'checkin_date': checkinDate,
      'checkin_time': checkinTime,
      'checkout_date': checkoutDate,
      'checkout_time': checkoutTime,
      'image': imageUrl,
    }).then((value) {
      print("booking Added");

      Fluttertoast.showToast(
        msg: 'Đặt lịch thành công',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }).catchError(
      (error) => print("Failed to add booking: $error"),
    );
  }

  Future confirmDialog() async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Xác Nhận Đặt Lịch'),
        content: Container(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: 'Giá vé : ',
                style: Styles.copyStyle(
                  fontSize: 20,
                  color: colorTvMain,
                ),
              ),
              TextSpan(
                text: '${setupdatePrice()}',
                style: Styles.copyStyle(
                  fontSize: 20,
                  color: colorTvRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' VND',
                style: Styles.copyStyle(
                  fontSize: 20,
                  color: colorTvRed,
                ),
              ),
            ]),
          ),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Không'),
              ),
              TextButton(
                onPressed: addBooking,
                child: Text('Xác Nhận'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
