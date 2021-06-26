import 'package:flutter/material.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/styles/styles.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                child: model.imageUrl == null || model.imageUrl.isEmpty
                    ? Container(
                        child: Text(
                          'không có ảnh',
                          style: Styles.copyStyle(),
                        ),
                        width: 100,
                        height: 100,
                      )
                    : Image(
                        image: NetworkImage(model.imageUrl),
                        width: 100,
                        height: 110,
                        fit: BoxFit.cover,
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
                      model.campName ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
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
                          'thời gian đặt: ',
                          style: Styles.copyStyle(),
                        ),
                        Expanded(
                          child: Text(
                            model.createDate.toDate().toString() ?? '',
                            style: Styles.copyStyle(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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
