import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/screen/user_book_details/user_book_details_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class ItemUserBookView extends StatelessWidget {
  const ItemUserBookView({
    Key key,
    this.model,
  }) : super(key: key);
  final BookingModel model;
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String dateTime = formatter.add_jm().format(model?.createDate?.toDate());
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserBookDetailsScreen(model: model),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(dateTime),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.userName,
                  style: TextStyle(
                    color: colorTvBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  model.stay,
                  style: TextStyle(
                    color: colorTvMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorDarkGray),
          ),
        ),
      ),
    );
  }
}
