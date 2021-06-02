import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/screen/info_user.dart/info_user_screen.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';
import 'package:yuru_camp/views/edt_info_view.dart';

/// cập nhật thông tin người dùng
class EdtInfoUserScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneController = TextEditingController();
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
              controller: _nameController,
            ),
            EdtInfoView(
              title: 'Email : ',
              controller: _emailController,
              enabled: false,
            ),
            EdtInfoView(
              title: 'Giới tính : ',
              controller: _genderController,
            ),
            EdtInfoView(
              title: 'Ngày sinh : ',
              controller: _birthController,
            ),
            EdtInfoView(
              title: 'Điện thoại : ',
              controller: _phoneController,
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
}
