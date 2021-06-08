import 'package:flutter/material.dart';
import 'package:yuru_camp/model/booking_model.dart';

class ItemRecentHisView extends StatelessWidget {
  const ItemRecentHisView({
    Key key,
    this.press,
    this.model,
  }) : super(key: key);

  final Function press;
  final BookingModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3, 4),
                blurRadius: 5,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                child: Image(
                  image: AssetImage('assets/images/nhathodo.jpg'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: double.infinity,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vườn quốc gia Ba Vì' ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Nội dung giới thiệu khu cắm trại' ?? '',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}