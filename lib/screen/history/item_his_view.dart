import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/styles.dart';

class ItemListHisView extends StatelessWidget {
  const ItemListHisView({
    Key key,
    this.model,
  }) : super(key: key);
  final BookingModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HisDetailsScreen(model: model),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(model.imageUrl),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      model.campName ?? '',
                      style: Styles.copyStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Ngày checkin: ',
                        style: Styles.copyStyle(),
                      ),
                      Text(
                        model.checkinDate ?? '',
                        style: Styles.copyStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'thời gian checkin: ',
                        style: Styles.copyStyle(),
                      ),
                      Text(
                        model.checkinTime ?? '',
                        style: Styles.copyStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Lưu trú: ',
                        style: Styles.copyStyle(),
                      ),
                      Text(
                        model.stay ?? '',
                        style: Styles.copyStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Giá vé: ',
                        style: Styles.copyStyle(),
                      ),
                      Text(
                        '${model.price} vnd' ?? '',
                        style: Styles.copyStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
