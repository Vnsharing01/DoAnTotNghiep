import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'view/image_item_view.dart';
import 'view/info_content_view.dart';
import 'view/info_address_view.dart';

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
              InfoAddressView(
                title: 'Camp Name : ',
                controller: campNameController,
              ),
              InfoAddressView(
                title: 'Địa chỉ : ',
                controller: addressController,
              ),
              InfoAddressView(
                title: 'Khu vực : ',
                controller: areaController,
              ),
              InfoAddressView(
                title: 'Hotline : ',
                controller: hotLineController,
              ),
              InfoAddressView(
                title: 'Fanpage : ',
                controller: fanPageController,
              ),
              InfoAddressView(
                title: 'Web : ',
                controller: webController,
              ),
              InfoContentView(
                title: 'Giới thiệu',
                controller: introController,
                inputAction: TextInputAction.next,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Thêm Ảnh',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageItemView(
                        image: _image1,
                      ),
                      ImageItemView(
                        image: _image2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageItemView(
                        image: _image3,
                      ),
                      ImageItemView(
                        image: _image4,
                      ),
                    ],
                  ),
                ],
              ),
              InfoContentView(
                title: 'Dịch vụ',
                controller: serviceController,
                inputAction: TextInputAction.done,
              ),
              BtnView(
                press: () {Navigator.of(context).pop(true);},
                text: 'cập nhật thông tin',
                color: colorPrimary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
