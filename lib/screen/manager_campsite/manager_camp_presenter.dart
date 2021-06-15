import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/model/mng_camp_model.dart';

class ManagerCampPresenter extends Presenter {
  ManagerCampPresenter(BuildContext context, Contract view)
      : super(context, view);

  CollectionReference getMng = FirebaseFirestore.instance.collection('manager');

  MngCampModel mngModel;
  CampsiteModel campModel;

  @override
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
      getCampsiteData();
    });
    
    super.init();
  }

  getData() {
    getMng.doc(inputData().email).get().then((DocumentSnapshot doc) {
      print('mng_camp : ${doc.data()}');
      if (!doc.exists) {
        return 'data null';
      }
      mngModel = mngCamp(doc);
      getCampsiteData(campName: mngCamp(doc).campName);
      print('mng : ${mngModel.campName}');
      view.updateSate();
      return mngModel;
    });
  }

  MngCampModel mngCamp(DocumentSnapshot doc) {
    return MngCampModel(
      campName: doc.data()['camp_name'],
      email: doc.data()['email'],
      mngName: doc.data()['user_name'],
    );
  }

  CampsiteModel campsite({DocumentSnapshot document}) {
    debugPrint('document.data(cam) -> ${document.data()} ');
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

  getCampsiteData({String campName}) {
    DocumentReference campRef = FirebaseFirestore.instance
        .collection('campsite')
        .doc(campName);
    campRef.get().then((DocumentSnapshot doc) {
      if (!doc.exists) {
        print('Document does not exist on the database');
        return null;
      }
      debugPrint('camp data : ${doc.data()}');
      campModel = campsite(document: doc);
      view.updateSate();
      debugPrint('campsite : ${campModel.images}');
      return campModel;
    });
  }
}
