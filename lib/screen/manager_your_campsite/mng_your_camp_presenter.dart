import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/manager_edit_camp_info/edit_camp_info_screen.dart';
import 'package:yuru_camp/screen/navigation_view.dart';
import 'package:yuru_camp/screen/user_book_list/user_book_list_screen.dart';

class MngYourCampPresenter extends Presenter {
  MngYourCampPresenter(BuildContext context, Contract view)
      : super(context, view);

  CollectionReference ref = FirebaseFirestore.instance.collection('campsite');
  CollectionReference mngRef = FirebaseFirestore.instance.collection('manager');

  void nextUserBookList({String campName}) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserBookListScreen(campName: campName),
      ),
    );
  }

  void nextEditCamp(CampsiteModel model) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditCampInfo( model: model),
      ),
    );
  }

  void deleteCampsite(campName) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Bạn muốn xóa địa điểm cắm trại này'),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Không'),
              ),
              TextButton(
                onPressed: () {
                  deleteData(campName);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => NavigationView(),
                    ),
                    (route) => false,
                  );
                },
                child: Text('Xác Nhận'),
              ),
            ],
          )
        ],
      ),
    );
  }

  deleteData(campName) {
    ref
        .doc(campName)
        .delete()
        .then((value) => print("campsite Deleted"))
        .catchError(
          (error) => print("Failed to delete user: $error"),
        );
    mngRef
        .doc(inputData().email)
        .delete()
        .then((value) => print("campsite Deleted"))
        .catchError(
          (error) => print("Failed to delete user: $error"),
        );
  }
}
