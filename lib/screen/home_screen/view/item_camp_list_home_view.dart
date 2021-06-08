import 'package:flutter/material.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_details/campsite_detail_screen.dart';

class ItemCampListHomeView extends StatelessWidget {
  const ItemCampListHomeView({
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
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: img == null || img.isEmpty
                  ? Container(
                      child: Text('không có ảnh'),
                      height: 140,
                      width: double.infinity,
                    )
                  : Image(
                      image: NetworkImage(img.first),
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.campName ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.intro ?? '',
                    // maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 4),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
