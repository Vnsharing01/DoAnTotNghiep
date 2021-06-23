import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yuru_camp/screen/navigation_view.dart';

class LoginApiClient {
  /// firestore
  CollectionReference createUser =
      FirebaseFirestore.instance.collection('user');

  /// login with email-password
  Future loginUser({
    String email,
    String password,
    BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NavigationView()));
      print('login successfuly $user');
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        //thêm dialog thông báo lỗi

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        //thêm dialog thông báo lỗi

      }
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// login with google
  Future googleSignIn(BuildContext context) async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      final User currentUser = _firebaseAuth.currentUser;

      
      return currentUser;
    } else {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);

      final User user = userCredential.user;
      debugPrint('googleSignIn ${user.displayName}');

      var userData = {
        'user_name': user.displayName,
        'avatar': user.photoURL,
        'email': user.email,
        'gender': '',
        'birth': '',
        'phone': '',
        'password': '',
      };

      
      createUser.doc(user.email).get().then((doc) {
        if (doc.exists) {
          doc.reference.get();
        } else {
          // thêm user vào fireStore
          createUser.doc(user.email).set(userData);
        }
      });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NavigationView()),
      );
    }
  }
}
