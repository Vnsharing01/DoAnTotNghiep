import 'package:flutter/material.dart';

import 'date_time_edt_item_view.dart';

class ItemCkInCkOutView extends StatelessWidget {
  const ItemCkInCkOutView({
    Key key,
    this.pressDate,
    this.pressTime,
    this.dateControl,
    this.timeControl,
    this.title,
  }) : super(key: key);

  final Function pressDate, pressTime;
  final TextEditingController dateControl, timeControl;
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: DateTimeEdtItemView(
                press: pressDate,
                title: 'Ngày',
                controller: dateControl,
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
                press: pressTime,
                title: 'Giờ',
                controller: timeControl,
                hint: '8:30',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
