import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/screen/navigation_view.dart';


class EditCampInfoPresenter extends Presenter {
  EditCampInfoPresenter(BuildContext context, Contract view)
      : super(context, view);
  CollectionReference campRef =
      FirebaseFirestore.instance.collection('campsite');

  final campNameController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final hotLineController = TextEditingController();
  final fanPageController = TextEditingController();
  final webController = TextEditingController();
  final introController = TextEditingController();
  final serviceController = TextEditingController();

  @override
  void init() {
    super.init();
  }

  Future<void> updateInfo(campName) async {
    Fluttertoast.showToast(
      msg: 'Cập nhật thành công',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => NavigationView(),
      ),
      (route) => false,
    );
    return campRef
        .doc(campName)
        .update({
          'campName': campNameController.text,
          'address': addressController.text,
          'area': areaController.text,
          'hotline': int.tryParse(hotLineController.text),
          'fanpage': fanPageController.text,
          'web': webController.text,
          'intro': introController.text,
          'service': serviceController.text,
        })
        .then((value) => print("campsite Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
