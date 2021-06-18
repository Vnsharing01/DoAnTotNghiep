import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/user_model.dart';
import 'package:yuru_camp/screen/info_user.dart/info_user_screen.dart';
import 'package:yuru_camp/screen/navigation_view.dart';

//TODO : tạm xong update info , chưa làm update avatar
class EditInfoUserPresenter extends Presenter {
  EditInfoUserPresenter(BuildContext context, Contract view)
      : super(context, view);

  CollectionReference users = FirebaseFirestore.instance.collection('user');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  UserModel userModel;

  @override
  void init() {
    
    super.init();
  }

  Future<void> updateInfo() async {
    Fluttertoast.showToast(
      msg: 'Cập nhật thành công',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => NavigationView()),
      (route) => false,
    );
    return users
        .doc(inputData().email)
        .update({
          'user_name': nameController.text,
          'birth': birthController.text,
          'gender': genderController.text,
          'phone': phoneController.text,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
