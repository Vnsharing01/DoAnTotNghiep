import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:flutter/material.dart';

class ItemListHisView extends StatelessWidget {
  const ItemListHisView({
    Key key,
    this.image,
    this.name,
    this.date,
    this.checkInTime,
    this.stay,
    this.prices,
  }) : super(key: key);
  @required
  final String image;
  @required
  final String name;
  @required
  final String date;
  @required
  final String checkInTime;
  @required
  final String stay;
  @required
  final int prices;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HisDetailsScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image),
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
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Ngày: '),
                      Text(date),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Check-in: '),
                      Text(checkInTime),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Lưu trú: '),
                      Text(stay),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Giá vé: '),
                      Text('$prices vnd'),
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
