import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuru_camp/styles/color.dart';

class ImageItemView extends StatefulWidget {
  /// thêm ảnh cần đẩy lên DB
  const ImageItemView({
    Key key,
    @required this.image,
  }) : super(key: key);
  final File image;

  @override
  _ImageItemViewState createState() => _ImageItemViewState();
}

class _ImageItemViewState extends State<ImageItemView> {
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    _image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_image != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: 175,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
                  child: Image.file(
            _image,
            width: double.infinity,
            height: 130,
            fit: BoxFit.cover,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    } else {
      return GestureDetector(
        onTap: _pickImage,
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

  void _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image selected');
      }
    });
  }
}
