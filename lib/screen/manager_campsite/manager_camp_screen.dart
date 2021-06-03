import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/manager_default/mng_df_screen.dart';
import 'package:yuru_camp/screen/manager_your_campsite/mng_your_camp_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class MngCampScreen extends StatefulWidget {
  @override
  _MngCampScreenState createState() => _MngCampScreenState();
}

class _MngCampScreenState extends State<MngCampScreen> {
  CollectionReference getUser =
      FirebaseFirestore.instance.collection('manager');
  CollectionReference getCampsite =
      FirebaseFirestore.instance.collection('campsite');
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    inputData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(''),
        leading: Container(),
      ),
      body: null ?? DfMngCampScreen(),
    );
  }

  void inputData() {
    user = auth.currentUser;
    final email = user.email;
    print(email);
  }

  Widget mngCamp() {
    getUser.doc(user.email).get().then((doc) {
      if (doc.exists) {}
    });
  }
}
