import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'view/edt_info_item_view.dart';
import 'view/image_item_view.dart';
import 'view/item_info_view.dart';

class MngAddCampScreen extends StatefulWidget {
  @override
  _MngAddCampScreenState createState() => _MngAddCampScreenState();
}

final campNameController = TextEditingController();
final addressController = TextEditingController();
final areaController = TextEditingController();
final hotLineController = TextEditingController();
final fanPageController = TextEditingController();
final webController = TextEditingController();

final introController = TextEditingController();
final serviceController = TextEditingController();

class _MngAddCampScreenState extends State<MngAddCampScreen> {
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
              ItemInfoView(
                title: 'Camp Name : ',
                hint: 'ABC Camp',
                controller: campNameController,
              ),
              ItemInfoView(
                title: 'Địa chỉ : ',
                hint: 'ABC Camp',
                controller: addressController,
              ),
              ItemInfoView(
                  title: 'Khu vực : ',
                  hint: 'ABC Camp',
                  controller: areaController),
              ItemInfoView(
                title: 'Hotline : ',
                hint: 'ABC Camp',
                controller: hotLineController,
              ),
              ItemInfoView(
                title: 'Fanpage : ',
                hint: 'ABC Camp',
                controller: fanPageController,
              ),
              ItemInfoView(
                title: 'Web : ',
                hint: 'ABC Camp',
                controller: webController,
              ),
              
              EdtInfoItemView(
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
                      ImageItemView(),
                      ImageItemView(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageItemView(),
                      ImageItemView(),
                    ],
                  ),
                ],
              ),
              EdtInfoItemView(
                title: 'Dịch vụ',
                controller: serviceController,
                inputAction: TextInputAction.done,
              ),
              BtnView(
                press: () {},
                text: 'Tạo Khu Cắm Trại',
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
