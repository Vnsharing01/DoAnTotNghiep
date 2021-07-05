import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/user_model.dart';
import 'package:yuru_camp/screen/edit_info_user/edt_info_user_screen.dart';
import 'package:yuru_camp/screen/login/login_screen.dart';

class InfoUserPresenter extends Presenter {
  InfoUserPresenter(BuildContext context, Contract view) : super(context, view);

  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  UserModel userModel;

  @override
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    getData();
    });
  }

  UserModel user(DocumentSnapshot doc) {
    return UserModel(
      email: doc.data()['email'],
      name: doc.data()['user_name'],
      avatar: doc.data()['avatar'],
      birth: doc.data()['birth'],
      gender: doc.data()['gender'],
      phone: doc.data()['phone'].toString(),
    );
  }

  UserModel getData() {
    ref.doc(inputData().email).get().then((DocumentSnapshot doc) {
      print('info : ${doc.data()}');
      if (!doc.exists) {
        return 'data null';
      }
      userModel = user(doc);
      print('info : $userModel');
      view.updateSate();
    });
    return userModel;
  }

  void onSelect(int item) {
    onSelected(context, item);
  }

  void onSelected(BuildContext context, item) async {
    switch (item) {
      case 1:
        await auth.signOut();
        await Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
        break;
    }
  }

  List<PopupMenuEntry<int>> itemBuild(BuildContext context) => [
        PopupMenuItem<int>(
          value: 1,
          child: Text('Đăng Xuất'),
        ),
      ];

  void nextEditInfo() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EdtInfoUserScreen(model: userModel),
      ),
    );
  }
}
