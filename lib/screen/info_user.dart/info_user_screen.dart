import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';


import 'package:yuru_camp/screen/info_user.dart/info_user_presenter.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/styles/styles.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'user_info_item_view.dart';

/// thông tin người dùng
class InfoUserScreen extends StatefulWidget {
  @override
  _InfoUserScreenState createState() => _InfoUserScreenState();
}

class _InfoUserScreenState extends State<InfoUserScreen> implements Contract {
  InfoUserPresenter _presenter;

  @override
  void initState() {
    _presenter = InfoUserPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: colorTransparent,
        elevation: 0,
        leading: Container(),
        actions: [
          PopupMenuButton<int>(
            onSelected: _presenter.onSelect,
            itemBuilder: _presenter.itemBuild,
            icon: Icon(
              Icons.settings,
              color: colorWhite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/manager_campsite.jpg'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(30),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: 
                          _presenter.userModel?.avatar == null ||
                                  _presenter.userModel.avatar.isEmpty
                              ? 
                              Image(
                                  image: AssetImage(
                                    'assets/images/default_avatar.png',
                                  ),
                                  width: 62,
                                  height: 62,
                                )
                              : 
                              Image(
                                  image: NetworkImage(
                                    _presenter.userModel?.avatar,
                                  ),
                                  width: 62,
                                  height: 62,
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            _presenter.userModel?.email ?? '-----',
                            style: Styles.copyStyle(
                              color: colorTvWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
            Column(
              children: [
                UserInfoItemView(
                  title: 'Tên:',
                  textInfo: _presenter.userModel?.name ?? '-----' ,
                ),
                UserInfoItemView(
                  title: 'Email:',
                  textInfo: _presenter.userModel?.email?? '-----',
                ),
                UserInfoItemView(
                  title: 'Giới tính:',
                  textInfo: _presenter.userModel?.gender?? '-----',
                ),
                UserInfoItemView(
                  title: 'Số điện thoại:',
                  textInfo: _presenter.userModel?.phone?? '-----',
                ),
                UserInfoItemView(
                  title: 'Ngày sinh:',
                  textInfo: _presenter.userModel?.birth?? '-----',
                ),
              ],
            ),
            BtnView(
              press: _presenter.nextEditInfo,
              text: 'Chỉnh sửa thông tin',
              color: colorPrimary,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            ),
          ],
        ),
      ),
    );
  }



  @override
  void updateSate() {
    setState(() {});
  }
}
