import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/screen/login/login_screen.dart';

//TODO: test thêm data vào bảng account
class SignUpApiClient {
  CollectionReference createUser =
      FirebaseFirestore.instance.collection('user');

  Future signUpUser({
    String email,
    String psw,
    String name,
    String phone,
    BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: psw,
      );
      User user = userCredential.user;
      print('user successfuly $user');

      /// thêm user vào fireStore
      createUser
          .doc(email)
          .set({
            'email': email,
            'user_name': name,
            'password': psw,
            'avatar': null,
            'gender': null,
            'birth': null,
            'phone': int.tryParse(phone),
          })
          .then((value) => print("User Added"))
          .catchError(
            (error) => print("Failed to add user: $error"),
          );

      toastInfo(msg: 'Đăng kí thành công');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak. Mật khẩu được cung cấp quá yếu');
        toastInfo(msg: 'Mật khẩu được cung cấp quá yếu');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email. đã tồn tại tài khoản với email này');
        toastInfo(msg: 'đã tồn tại tài khoản với email này');
      }
    } catch (e) {
      print(e);
    }
  }

  void toastInfo({String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}
