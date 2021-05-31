import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';

import 'package:yuru_camp/screen/edit_info_user/edt_info_user_screen.dart';

import 'package:yuru_camp/screen/login/login_screen.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'user_info_item_view.dart';

/// thông tin người dùng
class InfoUserScreen extends StatefulWidget {
  @override
  _InfoUserScreenState createState() => _InfoUserScreenState();
}

class _InfoUserScreenState extends State<InfoUserScreen> implements Contract {
  // InfoUserPresenter _presenter;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  // Stream getUserStream =
  //     FirebaseFirestore.instance.collection('user').doc().snapshots();

  @override
  void initState() {
    inputData();
    super.initState();
  }

  void inputData() {
    user = auth.currentUser;
    final email = user.email;
    print(email);
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
            onSelected: (item) => _onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 1,
                child: Text('Đăng Xuất'),
              ),
            ],
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
                          child: Image.asset(
                            'assets/images/default_avatar.png',
                            width: 62,
                            height: 62,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            user.email,
                            style: TextStyle(
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
                  textInfo: 'Chiriki Higo',
                ),
                UserInfoItemView(
                  title: 'Email:',
                  textInfo: 'Higo@gmail.com',
                ),
                UserInfoItemView(
                  title: 'Giới tính:',
                  textInfo: 'nam',
                ),
                UserInfoItemView(
                  title: 'Số điện thoại:',
                  textInfo: '0123456789',
                ),
                UserInfoItemView(
                  title: 'Ngày sinh:',
                  textInfo: '20/05/1999',
                ),
              ],
            ),
            BtnView(
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EdtInfoUserScreen(),
                  ),
                );
              },
              text: 'Chỉnh sửa thông tin',
              color: colorPrimary,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            ),
          ],
        ),
      ),
    );
  }

  _onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
        break;
    }
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
