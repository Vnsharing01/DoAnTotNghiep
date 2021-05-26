import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';
import 'package:yuru_camp/views/edt_info_view.dart';

import 'view/image_item_view.dart';
import 'view/info_content_view.dart';

  /// chỉnh sửa nội dung campsite
class EditCampInfo extends StatefulWidget {
  @override
  _EditCampInfoState createState() => _EditCampInfoState();
}

final campNameController = TextEditingController();
final addressController = TextEditingController();
final areaController = TextEditingController();
final hotLineController = TextEditingController();
final fanPageController = TextEditingController();
final webController = TextEditingController();

final introController = TextEditingController();
final serviceController = TextEditingController();

File _image1, _image2, _image3, _image4;
final picker = ImagePicker();

class _EditCampInfoState extends State<EditCampInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Text('chỉnh sửa nội dung'),
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EdtInfoView(
                title: 'Camp Name : ',
                controller: campNameController,
              ),
              EdtInfoView(
                title: 'Địa chỉ : ',
                controller: addressController,
              ),
              EdtInfoView(
                title: 'Khu vực : ',
                controller: areaController,
              ),
              EdtInfoView(
                title: 'Hotline : ',
                controller: hotLineController,
              ),
              EdtInfoView(
                title: 'Fanpage : ',
                controller: fanPageController,
              ),
              EdtInfoView(
                title: 'Web : ',
                controller: webController,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Thêm Ảnh',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  _rowImages(image1: _image1, image2: _image2),
                  _rowImages(image1: _image3, image2: _image4),
                ],
              ),
              InfoContentView(
                title: 'Giới thiệu',
                controller: introController,
                inputAction: TextInputAction.next,
              ),
              
              InfoContentView(
                title: 'Dịch vụ',
                controller: serviceController,
                inputAction: TextInputAction.done,
              ),
              BtnView(
                press: () {
                  Navigator.of(context).pop(true);
                },
                text: 'cập nhật nội dung',
                color: colorPrimary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowImages({File image1, File image2}) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ImageItemView(
                        image: image1,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ImageItemView(
                        image: image2,
                      ),
                    ),
                  ],
                );
  }
}
