import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite.dart';

import 'item_camp_list_view.dart';

class CampsiteListPresenter extends Presenter {
  CampsiteListPresenter(BuildContext context, Contract view)
      : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');

  CampsiteModel _campsiteModel;
  Widget campsiteAll() {
    return StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, index) {
                _campsiteModel = CampsiteModel(
                  campName: snapshot.data.docs[index].data()['camp_name'],
                  email: snapshot.data.docs[index].data()['email'],
                  address: snapshot.data.docs[index].data()['address'],
                  area: snapshot.data.docs[index].data()['area'],
                  hotline: snapshot.data.docs[index].data()['hotline'],
                  fanpage: snapshot.data.docs[index].data()['fanpage'],
                  web: snapshot.data.docs[index].data()['web'],
                  intro: snapshot.data.docs[index].data()['intro'],
                  service: snapshot.data.docs[index].data()['service'],
                  personPrice: snapshot.data.docs[index].data()['person_price'],
                  childPrice: snapshot.data.docs[index].data()['child_price'],
                  latitude: snapshot.data.docs[index].data()['latitude'],
                  longitude: snapshot.data.docs[index].data()['longitude'],
                  images: snapshot.data.docs[index].data()['images'],
                );

                return ItemCampListView(
                  model: _campsiteModel,
                );
              });
        });
  }
}
