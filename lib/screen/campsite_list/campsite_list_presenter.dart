import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite.dart';
import 'package:yuru_camp/screen/campsite_list/camp_area_list/camp_area_list_screen.dart';

import 'item_camp_list_view.dart';

class CampsiteListPresenter extends Presenter {
  CampsiteListPresenter(BuildContext context, Contract view)
      : super(context, view);

  final areaController = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');

  CampsiteModel _campsiteModel;
  Widget campsiteAll() {
    return StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return ListView(
            padding: EdgeInsets.only(top: 10),
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              _campsiteModel = campsite(document);
              return ItemCampListView(
                model: _campsiteModel,
              );
            }).toList(),
          );
        });
  }

  CampsiteModel campsite(DocumentSnapshot document) {
    return CampsiteModel(
      campName: document.data()['camp_name'],
      email: document.data()['email'],
      address: document.data()['address'],
      area: document.data()['area'],
      hotline: document.data()['hotline'],
      fanpage: document.data()['fanpage'],
      web: document.data()['web'],
      intro: document.data()['intro'],
      service: document.data()['service'],
      personPrice: document.data()['person_price'],
      childPrice: document.data()['child_price'],
      latitude: document.data()['latitude'],
      longitude: document.data()['longitude'],
      images: document.data()['images'],
    );
  }

  searchArea(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CampAreaListScreen(
          area: areaController.text,
        ),
      ),
    );
  }
}
