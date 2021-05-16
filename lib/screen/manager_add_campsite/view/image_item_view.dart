import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class ImageItemView extends StatelessWidget {
  /// thêm ảnh cần đẩy lên DB
  const ImageItemView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/add_image.png'),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'chọn ảnh cần đăng',
                style: TextStyle(color: colorWhite),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
                border: Border.all(color: colorPrimary),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorPrimary),
        ),
      ),
    );
  }
}
