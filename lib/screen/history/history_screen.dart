import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/history/history_presenter.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_item_view.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> implements Contract {
  HistoryPresenter _presenter;

  @override
  void initState() {
    _presenter = HistoryPresenter(context, this);
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
        title: Text('Lịch sử đặt lịch'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: _presenter.hideKeyBoard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: _presenter.dateController,
                      decoration: InputDecoration(
                        hintText: '09-09-2021',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        fillColor: colorWhite,
                        filled: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: BtnItemView(
                      press: _presenter.showHisByDate,
                      text: 'Tìm',
                      color: colorPrimary,
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 5, color: Colors.grey),
            Expanded(child: _presenter.allHisBooking())
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
