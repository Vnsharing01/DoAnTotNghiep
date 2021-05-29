import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpApiClient {
      CollectionReference createUser =
          FirebaseFirestore.instance.collection('user');

  Future signUpUser({
    String email,
    String psw,
    String name,
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
      createUser.doc(email).set({
        'email': email,
        'user_name': name,
        'password': psw,
        'avatar': '',
        'gender': '',
        'birth': '',
        'phone': '',
      }).then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
      Navigator.of(context).pop();

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


}
