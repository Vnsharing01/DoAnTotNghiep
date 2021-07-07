
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/model/user_model.dart';

class MngAddCampApiCLient {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  CollectionReference userRef =
      FirebaseFirestore.instance.collection('user');
  CollectionReference addCampsite =
      FirebaseFirestore.instance.collection('campsite');
  CollectionReference addCamMng =
      FirebaseFirestore.instance.collection('manager');

  /// tạo campsite mới
  void createCampsite({
    String campName,
    String address,
    String area,
    String fanPage,
    int hotline,
    String intro,
    String web,
    String service,
    double latiude,
    double longitude,
    BuildContext context,
    int personPrice,
    int childPrice,
    List images,
  }) async {
    user = auth.currentUser;

    /// thêm campsite vào fireStore
    await addCampsite.doc(campName).set({
      'email': user.email,
      'camp_name': campName,
      'address': address ?? null,
      'area': area ?? null,
      'fanpage': fanPage ?? null,
      'hotline': hotline ?? null,
      'intro': intro ?? null,
      'web': web ?? null,
      'service': service ?? null,
      'latitude': latiude ?? null,
      'longitude': longitude ?? null,
      'person_price': personPrice ?? null,
      'child_price': childPrice ?? null,
      'images' : images ?? null,
    }).then((value) {
      print("campsite Added");
      createCampMng(campName: campName);

      Fluttertoast.showToast(
        msg: 'tạo thành công',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }).catchError(
      (error) => print("Failed to add campsite: $error"),
    );
  }

  /// tạo quản lý khu cắm trại mới
  void createCampMng({String campName}) async {
    await addCamMng.doc(user.email).set({
      'email': user.email,
      'camp_name': campName,
      'user_name': userModel().name,
    }).then((value) {
      print("User Mng successfuly");
    }).catchError(
      (error) => print("Failed to add mng: $error"),
    );
  }

  UserModel userModel() {
    UserModel _user;
    userRef.doc(user.email).get().then((doc) {
       return _user = UserModel(
      name: doc.data()['user_name'],
      email: user.email
    );
    });
    return _user;
  }
}
