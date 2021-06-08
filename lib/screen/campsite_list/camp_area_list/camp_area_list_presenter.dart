import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite.dart';
import 'package:yuru_camp/screen/campsite_list/item_camp_list_view.dart';

class CampAreaPresenter extends Presenter {
  CampAreaPresenter(BuildContext context, Contract view) : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');

  CampsiteModel _campsiteModel;

  Widget listCamp(String area) {
    return StreamBuilder(
      stream: ref.where('area', isEqualTo: area).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Loading..."),
          );
        }
        if (snapshot.data.docs.isEmpty) {
          return Center(
            child: Text(
              'Không có khu cắm trại nào trong khu vực này',
              textAlign: TextAlign.center,
            ),
          );
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
      },
    );
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
}
