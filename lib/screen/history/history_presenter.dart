import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/model/user_model.dart';
import 'package:yuru_camp/screen/history/his_by_date/his_by_date_screen.dart';

import 'item_his_view.dart';

class HistoryPresenter extends Presenter {
  HistoryPresenter(BuildContext context, Contract view) : super(context, view);

  final dateController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference hisRef = FirebaseFirestore.instance.collection('booking');

  BookingModel _bookingModel;

  UserModel userData() {
    final User user = auth.currentUser;
    return UserModel(
      email: user.email,
      avatar: user.photoURL,
      name: user.displayName,
    );
  }

  BookingModel booking(DocumentSnapshot doc) {
    return BookingModel(
      email: doc.data()['email'],
      campName: doc.data()['camp_name'],
      userName: doc.data()['user_name'],
      people: doc.data()['people'],
      children: doc.data()['children'],
      stay: doc.data()['stay'],
      createDate: doc.data()['create_date'],
      checkinDate: doc.data()['checkin_date'],
      price: doc.data()['price'],
      checkinTime: doc.data()['checkin_time'],
      checkoutDate: doc.data()['checkout_date'],
      checkoutTime: doc.data()['checkout_time'],
      imageUrl: doc.data()['image'],
    );
  }

  Widget allHisBooking() {
    return StreamBuilder<QuerySnapshot>(
        stream: hisRef.where('email', isEqualTo: userData().email).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }

          return Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot _doc = snapshot.data.docs[index];
                  _bookingModel = booking(_doc);

                  return ItemListHisView(model: _bookingModel);
                }),
          );
        });
  }

  void showHisByDate() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HisByDateScreen(
          checkinDate: dateController.text,
        ),
      ),
    );
  }
}
