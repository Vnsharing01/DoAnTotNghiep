import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/history/his_by_date/his_by_date_presenter.dart';

class HisByDateScreen extends StatefulWidget {

  final String checkinDate;

  const HisByDateScreen({Key key, this.checkinDate}) : super(key: key);
  @override
  _HisByDateScreenState createState() => _HisByDateScreenState();
}

class _HisByDateScreenState extends State<HisByDateScreen> implements Contract {
  HisByDatePresenter _presenter;

  @override
  void initState() {
    _presenter = HisByDatePresenter(context, this);
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
        title: Text('Ngày ${widget.checkinDate}'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: _presenter.allHisBooking(widget.checkinDate),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
