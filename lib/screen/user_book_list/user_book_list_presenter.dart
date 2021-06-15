import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/booking_model.dart';

import 'item_user_book_view.dart';

class UserBookListPresenter extends Presenter {
  UserBookListPresenter(BuildContext context, Contract view)
      : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('booking');

  BookingModel bookingModel;

  @override
  void init() {
    getCampName();
    super.init();
  }

  String getCampName({String campName}) {
    return campName;
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
      imageUrl: doc.data()['image'],
    );
  }

  Widget selectUserBooking({String campName}) {
    return StreamBuilder<QuerySnapshot>(
        stream: ref.where('camp_name', isEqualTo: campName).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot _doc = snapshot.data.docs[index];

              bookingModel = booking(_doc);
              return ItemUserBookView(model: bookingModel);
            },
          );
        });
  }
}
