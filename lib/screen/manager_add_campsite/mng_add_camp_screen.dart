import 'package:flutter/material.dart';

import 'package:yuru_camp/base/contract.dart';

import 'package:yuru_camp/screen/manager_add_campsite/mng_add_camp_presenter.dart';

import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'view/edt_info_content_view.dart';
import 'view/item_info_view.dart';

class MngAddCampScreen extends StatefulWidget {
  @override
  _MngAddCampScreenState createState() => _MngAddCampScreenState();
}

class _MngAddCampScreenState extends State<MngAddCampScreen>
    implements Contract {
  AddCampPresnter _presnter;

  @override
  void initState() {
    _presnter = AddCampPresnter(context, this);

    super.initState();
  }

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
        onTap: _presnter.hideKeyBoard,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ItemInfoView(
                title: 'Camp Name : ',
                hint: 'ABC Camp',
                controller: _presnter.campNameController,
              ),
              ItemInfoView(
                title: 'Địa chỉ : ',
                hint: 'ABC Camp',
                controller: _presnter.addressController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ItemInfoView(
                      title: 'latitude : ',
                      hint: '21.0228161',
                      controller: _presnter.latitudeController,
                      textType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ItemInfoView(
                      title: 'logitude : ',
                      hint: '105.801944',
                      controller: _presnter.longitudeController,
                      textType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              ItemInfoView(
                title: 'Khu vực : ',
                hint: 'Hà Nội',
                controller: _presnter.areaController,
              ),
              ItemInfoView(
                title: 'Hotline : ',
                hint: '0123456789',
                controller: _presnter.hotLineController,
                textType: TextInputType.number,
              ),
              ItemInfoView(
                title: 'Fanpage : ',
                hint: 'fb/abccamp.com',
                controller: _presnter.fanPageController,
              ),
              ItemInfoView(
                title: 'Web : ',
                hint: 'abccamp.com.vn',
                controller: _presnter.webController,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Giá vé',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  ItemInfoView(
                    title: 'người lớn : ',
                    hint: '100000 vnd',
                    controller: _presnter.personPriceController,
                    textType: TextInputType.number,
                  ),
                  SizedBox(width: 10),
                  ItemInfoView(
                    title: 'trẻ em : ',
                    hint: '50000 vnd',
                    controller: _presnter.chilPriceController,
                    textType: TextInputType.number,
                  ),
                ],
              ),
              EdtInfoContentView(
                title: 'Giới thiệu',
                controller: _presnter.introController,
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
                  Container(
                    width: double.infinity,
                    height: 260,
                    child: GridView.builder(
                      shrinkWrap: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: _presnter.images.length + 1,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                width: 60,
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: IconButton(
                                  iconSize: 46,
                                  icon: Icon(Icons.add_a_photo_rounded),
                                  onPressed: _presnter.images.length + 1 < 5
                                      ? _presnter.pickImage
                                      : _presnter.toastMaxIamge,
                                ),
                                decoration: BoxDecoration(
                                  color: colorMediumGray,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _presnter.images[index - 1],
                                    width: double.infinity,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                      },
                    ),
                  )
                ],
              ),
              EdtInfoContentView(
                title: 'Dịch vụ',
                controller: _presnter.serviceController,
                inputAction: TextInputAction.done,
              ),
              BtnView(
                press: _presnter.createCampsite,
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

  @override
  void updateSate() {
    setState(() {});
  }
}
