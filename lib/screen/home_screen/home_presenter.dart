import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/booking_model.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_list/campsite_list_screen.dart';
import 'package:yuru_camp/screen/history/history_screen.dart';
import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:yuru_camp/screen/home_screen/view/item_camp_list_home_view.dart';

import 'view/item_recent_his_view.dart';

class HomePresenter extends Presenter {
  HomePresenter(BuildContext context, Contract view) : super(context, view);

  CollectionReference campRef =
      FirebaseFirestore.instance.collection('campsite');
  CollectionReference hisRef = FirebaseFirestore.instance.collection('booking');
  CampsiteModel _campsiteModel;
  BookingModel bookingModel;

  @override
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.init();
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
    DateTime _now = DateTime.now();
    DateTime _start = DateTime(_now.year, _now.month, 1, 0, 0, 0);
    DateTime _end = DateTime(_now.year, _now.month, _now.day, 23, 59, 59);
    view.updateSate();
    return StreamBuilder<QuerySnapshot>(
        stream: hisRef.where('email', isEqualTo: inputData().email).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          debugPrint(' thời gian hiện tại : ${DateTime.now()}');
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                final DocumentSnapshot _doc = snapshot.data.docs[index];

                bookingModel = booking(_doc);

                debugPrint(
                    'create_date: ${bookingModel?.createDate?.toDate()}');

                return bookingModel.createDate.toDate().isAfter(_end) &&
                        bookingModel.createDate.toDate().isBefore(_start)
                    ? Text("Không có thông tin đặt lịch nào ....")
                    : ItemRecentHisView(
                        model: bookingModel,
                        press: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HisDetailsScreen(
                              model: bookingModel,
                            ),
                          ));
                        },
                      );
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
