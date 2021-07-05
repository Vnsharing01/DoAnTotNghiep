
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/manager_edit_camp_info/edit_camp_info_presenter.dart';

import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';
import 'package:yuru_camp/views/edt_info_view.dart';

import 'view/info_content_view.dart';

/// chỉnh sửa nội dung campsite
class EditCampInfo extends StatefulWidget {
  const EditCampInfo({Key key, this.model}) : super(key: key);

  final CampsiteModel model;

  @override
  _EditCampInfoState createState() => _EditCampInfoState();
}

class _EditCampInfoState extends State<EditCampInfo> implements Contract {
  EditCampInfoPresenter _presenter;

  @override
  void initState() {
    _presenter = EditCampInfoPresenter(context, this);
    _presenter.campNameController.text = widget.model.campName;
    _presenter.addressController.text = widget.model.address;
    _presenter.areaController.text = widget.model.area;
    _presenter.hotLineController.text = widget.model.hotline.toString();
    _presenter.fanPageController.text = widget.model.fanpage;
    _presenter.webController.text = widget.model.web;
    _presenter.introController.text = widget.model.intro;
    _presenter.serviceController.text = widget.model.service;
    super.initState();
  }

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
                controller: _presenter.campNameController,
              ),
              EdtInfoView(
                title: 'Địa chỉ : ',
                controller: _presenter.addressController,
              ),
              EdtInfoView(
                title: 'Khu vực : ',
                controller: _presenter.areaController,
              ),
              EdtInfoView(
                title: 'Hotline : ',
                controller: _presenter.hotLineController,
              ),
              EdtInfoView(
                title: 'Fanpage : ',
                controller: _presenter.fanPageController,
              ),
              EdtInfoView(
                title: 'Web : ',
                controller: _presenter.webController,
              ),
             
              InfoContentView(
                title: 'Giới thiệu',
                controller: _presenter.introController,
                inputAction: TextInputAction.next,
              ),
              InfoContentView(
                title: 'Dịch vụ',
                controller: _presenter.serviceController,
                inputAction: TextInputAction.done,
              ),
              BtnView(
                press: () => _presenter.updateInfo(widget.model.campName),
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

 

  @override
  void updateSate() {
    setState(() {});
  }
}
