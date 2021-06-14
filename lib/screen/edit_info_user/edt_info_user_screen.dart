import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/edit_info_user/edt_info_user_presenter.dart';
import 'package:yuru_camp/screen/info_user.dart/info_user_screen.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';
import 'package:yuru_camp/views/edt_info_view.dart';

/// cập nhật thông tin người dùng
class EdtInfoUserScreen extends StatefulWidget {
  @override
  _EdtInfoUserScreenState createState() => _EdtInfoUserScreenState();
}

class _EdtInfoUserScreenState extends State<EdtInfoUserScreen>
    implements Contract {
  EditInfoUserPresenter _presenter;

  @override
  void initState() {
    _presenter = EditInfoUserPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Text('cập nhật thông tin'),
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/default_avatar.png',
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            EdtInfoView(
              title: 'Tên : ',
              controller: _presenter.nameController,
            ),
            EdtInfoView(
              title: 'Email : ',
              controller: _presenter.emailController,
              enabled: false,
            ),
            EdtInfoView(
              title: 'Giới tính : ',
              controller: _presenter.genderController,
            ),
            EdtInfoView(
              title: 'Ngày sinh : ',
              controller: _presenter.birthController,
            ),
            EdtInfoView(
              title: 'Điện thoại : ',
              controller: _presenter.phoneController,
            ),
            BtnView(
              press: () {
                Fluttertoast.showToast(
                  msg: 'Cập nhật thành công',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => InfoUserScreen()),
                  (route) => false,
                );
              },
              text: 'Cập nhật thông tin',
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              color: colorPrimary,
            )
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
