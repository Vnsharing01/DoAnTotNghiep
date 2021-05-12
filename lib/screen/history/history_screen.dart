import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:flutter/material.dart';

import 'item_his_view.dart';

class HistoryScreen extends StatelessWidget {
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
        title: Text('Lịch sử cắm trại'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: '09-09-2021',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
              ),
            ),
            Divider(height: 5, color: Colors.grey),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ItemListHisView(
                    image: 'assets/images/nhathodo.jpg',
                    name: 'ABC Camp',
                    date: '09-05-2021',
                    checkInTime: '08:21 AM',
                    stay: 'qua đêm',
                    prices: 400000,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


