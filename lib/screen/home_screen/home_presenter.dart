import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite.dart';
import 'package:yuru_camp/screen/campsite_list/campsite_list_screen.dart';
import 'package:yuru_camp/screen/history_details/his_details_screen.dart';
import 'package:yuru_camp/screen/home_screen/view/item_camp_list_home_view.dart';

class HomePresenter extends Presenter {
  HomePresenter(BuildContext context, Contract view) : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');

  CampsiteModel _campsiteModel;
  Widget showCampsite() {
    return StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final DocumentSnapshot _doc = snapshot.data.docs[index];
                _campsiteModel = campsite(_doc);
                return ItemCampListHomeView(
                  model: _campsiteModel,
                );
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

  void showAllHistory() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HisDetailsScreen(),
    ));
  }

  void showAllCampsite() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CampsiteListScreen(),
      ),
    );
  }
}
