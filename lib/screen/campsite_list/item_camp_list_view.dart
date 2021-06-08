
import 'package:flutter/material.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_details/campsite_detail_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class ItemCampListView extends StatelessWidget {
  const ItemCampListView({
    Key key,
    this.model,
  }) : super(key: key);

  final CampsiteModel model;


  @override
  Widget build(BuildContext context) {
    List img = model.images;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CampsiteDetailScreen(model: model),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        height: 133,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: img == null || img.isEmpty
                  ? Container(
                      child: Text('không có ảnh'),
                      width: 130,
                      height: 125,
                    )
                  : Image(
                      image: NetworkImage(img.first),
                      width: 130,
                      height: 125,
                      fit: BoxFit.cover,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.campName ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      model.intro ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(
                          text: model.personPrice.toString(),
                          children: [
                            TextSpan(
                              text: ' vnd/ng',
                              style: TextStyle(
                                color: colorTvMain,
                                fontSize: 14,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: colorDarkGray,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
      ),
    );
  }
}
