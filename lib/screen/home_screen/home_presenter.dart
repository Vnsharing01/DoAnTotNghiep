import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/model/user_model.dart';
import 'package:yuru_camp/screen/campsite_list/campsite_list_screen.dart';
import 'package:yuru_camp/screen/history/history_screen.dart';
import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:yuru_camp/screen/home_screen/view/item_camp_list_home_view.dart';

import 'view/item_recent_his_view.dart';

class HomePresenter extends Presenter {
  HomePresenter(BuildContext context, Contract view) : super(context, view);

  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference campRef =
      FirebaseFirestore.instance.collection('campsite');
  CollectionReference hisRef = FirebaseFirestore.instance.collection('booking');
  CampsiteModel _campsiteModel;
  BookingModel _bookingModel;

  UserModel userData() {
    final User user = auth.currentUser;
    return UserModel(
      email: user.email,
      avatar: user.photoURL,
      name: user.displayName,
    );
  }

  /// truy xuất campsite
  Widget showCampsite() {
    return StreamBuilder<QuerySnapshot>(
        stream: campRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final DocumentSnapshot _doc = snapshot.data.docs[index];
                _campsiteModel = campsite(_doc);
                return ItemCampListHomeView(model: _campsiteModel);
              });
        });
  }

  CampsiteModel campsite(DocumentSnapshot doc) {
    return CampsiteModel(
      campName: doc.data()['camp_name'],
      email: doc.data()['email'],
      address: doc.data()['address'],
      area: doc.data()['area'],
      hotline: doc.data()['hotline'],
      fanpage: doc.data()['fanpage'],
      web: doc.data()['web'],
      intro: doc.data()['intro'],
      service: doc.data()['service'],
      personPrice: doc.data()['person_price'],
      childPrice: doc.data()['child_price'],
      latitude: doc.data()['latitude'],
      longitude: doc.data()['longitude'],
      images: doc.data()['images'],
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
      imageUrl: doc.data()['image'],
    );
  }

  /// truy xuất lịch đặt gần nhất
  Widget showrecentHisBooking() {

    return StreamBuilder<QuerySnapshot>(
        stream: hisRef
            .where('create_date', isLessThanOrEqualTo: DateTime.now())
            .orderBy('create_date', descending: true)
            .limit(1)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          debugPrint(' thời gian hiện tại : ${DateTime.now()}');
          if (!snapshot.hasData) {
            return Text("Loading...");
          }

          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot _doc = snapshot.data.docs[index];
                if (_doc.data()['email'] == userData().email) {
                  _bookingModel = booking(_doc);
                  debugPrint(
                      'thời gian khởi tạo : ${_bookingModel.createDate.toDate()}');

                  return ItemRecentHisView(
                    model: _bookingModel,
                    press: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HisDetailsScreen(
                          model: _bookingModel,
                        ),
                      ));
                    },
                  );
                } else {
                  return Text("Không có thông tin đặt lịch nào ....");
                }
              });
        });
  }

  void showAllHistory() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HistoryScreen(),
      ),
    );
  }

  void showAllCampsite() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CampsiteListScreen(),
      ),
    );
  }
}
