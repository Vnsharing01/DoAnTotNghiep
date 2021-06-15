import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/user_book_list/user_book_list_presenter.dart';

import 'package:yuru_camp/styles/color.dart';
/// màn danh sách lịch đặt của khách
class UserBookListScreen extends StatefulWidget {
  const UserBookListScreen({Key key, this.campName}) : super(key: key);

  final String campName;

  @override
  _UserBookListScreenState createState() => _UserBookListScreenState();
}

class _UserBookListScreenState extends State<UserBookListScreen>
    implements Contract {
  UserBookListPresenter _presenter;

  @override
  void initState() {
    _presenter = UserBookListPresenter(context, this);
    _presenter.getCampName(campName: widget.campName);
    super.initState();
  }

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
      body: _presenter.selectUserBooking(campName: widget.campName),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
