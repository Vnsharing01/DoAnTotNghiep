import 'package:date_format/date_format.dart';
import 'package:yuru_camp/screen/booking_schedule/confirm_screen/confirm_booking_screen.dart';
import 'package:yuru_camp/views/btn_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'view/date_time_edt_item_view.dart';
import 'view/edt_book_item_view.dart';
import 'view/radio_item_view.dart';

/// màn hình đặt lịch
class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  //
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _personController = TextEditingController();
  TextEditingController _chilController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  int selectRadio;
  String titlRadio;

  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat('dd-MM-yyyy');
  int _price;
  String _hour, _minute, _time;
  TimeOfDay selectTime = TimeOfDay(hour: 00, minute: 00);

  setSelectRadio(int val) {
    setState(() {
      selectRadio = val;
    });
  }

  String setupdatePrice(BuildContext context) {
    setState(() {
      _price = (int.parse(_personController.text) * 100000) -
          (int.parse(_chilController.text) * 50000);
    });
    return _price.toString();
  }

  /// show and tick date
  Future _selectDate(BuildContext context) async {
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      setState(() {
        selectedDate = picker;
        _dateController.text = df.format(selectedDate);
      });
    }
  }

  /// show and tick time
  Future selectedTime(BuildContext context) async {
    final TimeOfDay picker = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (picker != null) {
      setState(() {
        selectTime = picker;
        _hour = selectTime.hour.toString();
        _minute = selectTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2000, 1, 1, selectTime.hour, selectTime.minute),
            [hh, ':', nn, ' ', am]).toString();
      });
    }
  }

  @override
  void initState() {
    selectRadio = 0;
    titlRadio = '';

    _price = 0;
    _personController.text = '1';
    _chilController.text = '0';

    _dateController.text = df.format(selectedDate);
    _timeController.text =
        formatDate(selectedDate, [hh, ':', nn, ' ', am]).toString();
    super.initState();
  }

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
              controller: _emailController,
            ),
            EdtBookItemView(
              title: 'Name',
              hint: 'UserName',
              controller: _nameController,
            ),
            Row(
              children: [
                RadioItemView(
                  title: 'trong ngày',
                  value: 1,
                  grpVal: selectRadio,
                  onChanged: (val) {
                    setSelectRadio(val);
                    titlRadio = 'trong ngày';
                  },
                ),
                RadioItemView(
                  title: 'qua đêm',
                  value: 2,
                  grpVal: selectRadio,
                  onChanged: (val) {
                    setSelectRadio(val);
                    titlRadio = 'qua đêm';
                  },
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
                    controller: _personController,
                    textType: TextInputType.number,
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                Expanded(
                  flex: 3,
                  child: EdtBookItemView(
                    title: 'Số trẻ em',
                    hint: '5',
                    controller: _chilController,
                    textType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Text(
              'Thời gian check in dự kiến: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: DateTimeEdtItemView(
                    press: () {
                      _selectDate(context);
                    },
                    title: 'Ngày',
                    controller: _dateController,
                    hint: 'dd/mm/yy',
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: DateTimeEdtItemView(
                    press: () {
                      selectedTime(context);
                    },
                    title: 'Giờ',
                    controller: _timeController,
                    hint: '8:30',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Row(
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConfirmBookingScreen(
                            email: _emailController.text,
                            name: _nameController.text,
                            stay: titlRadio,
                            numPerson: int.parse(_personController.text),
                            numChild: int.parse(_chilController.text),
                            date: _dateController.text,
                            time: _timeController.text,
                          ),
                        ),
                      );
                    },
                    text: 'xác nhận',
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
}
