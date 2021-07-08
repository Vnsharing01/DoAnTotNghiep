import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_list/item_camp_list_view.dart';

class CampAreaPresenter extends Presenter {
  CampAreaPresenter(
      BuildContext context, Contract view, this.searchTxt, this.allcampModel)
      : super(context, view);
  final String searchTxt;
  final CampsiteModel allcampModel;

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');

  CampsiteModel campsiteModel;

  @override
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      campList();
    });

    super.init();
  }

  Widget campList() {
    return StreamBuilder(
      stream: ref.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Loading..."),
          );
        }

        return ListView(
          padding: EdgeInsets.only(top: 10),
          children: snapshot.data.docs.map((doc) {
            if (doc.exists) {
              debugPrint('searchTxt $searchTxt ');
              if (searchTxt.trim() == doc.get('area')) {
                campsiteModel = campsite(doc);
              } else if (searchTxt.trim() == doc.get('camp_name')) {
                campsiteModel = campsite(doc);
              } else {
                campsiteModel = null;
              }
              return ItemCampListView(
                model: campsiteModel,
              );
            }
            return Center(
              child: Text(
                'Không có khu cắm trại nào...',
                textAlign: TextAlign.center,
              ),
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
