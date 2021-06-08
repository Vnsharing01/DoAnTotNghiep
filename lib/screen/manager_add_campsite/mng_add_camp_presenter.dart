import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/screen/manager_add_campsite/add_camp_api_client.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

import '../navigation_view.dart';

class AddCampPresnter extends Presenter {
  AddCampPresnter(BuildContext context, Contract view) : super(context, view);

  final campNameController = TextEditingController();
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final areaController = TextEditingController();
  final hotLineController = TextEditingController();
  final fanPageController = TextEditingController();
  final webController = TextEditingController();

  final introController = TextEditingController();
  final serviceController = TextEditingController();
  final personPriceController = TextEditingController();
  final chilPriceController = TextEditingController();

  MngAddCampApiCLient _apiCLient = MngAddCampApiCLient();

  firebase_storage.Reference ref;

  final images = List<File>();
  final picker = ImagePicker();

  /// thêm campsite mới
  createCampsite() async {
    try {
      _apiCLient.createCampsite(
        campName: campNameController.text,
        address: addressController.text,
        area: areaController.text,
        fanPage: fanPageController.text,
        hotline: int.tryParse(hotLineController.text),
        intro: introController.text,
        web: webController.text,
        service: serviceController.text,
        latiude: double.tryParse(latitudeController.text),
        longitude: double.tryParse(longitudeController.text),
        personPrice: int.tryParse(personPriceController.text),
        childPrice: int.tryParse(chilPriceController.text),
      );
      uploadImage(campName: campNameController.text);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavigationView()),
        (route) => false,
      );
    } catch (e, stack) {
      view.updateSate();
      debugPrint('$e, $stack');
    }
  }

  /// lấy ảnh từ thư viện
  void pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile.path != null) {
      images.add(File(pickedFile.path));
      view.updateSate();
    } else {
      print('no image selected');
    }
  }

  /// up ảnh lên fireStorage
  uploadImage({String campName}) async {
    for (File img in images) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('campsite/$campName/${Path.basename(img.path)}');
      print('campsite/$campName/${Path.basename(img.path)}');
      await ref.putFile(img);
      addImage(campName);
    }
  }

  /// thêm image vào firestore
  addImage(String campName) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('campsite').doc(campName);
    final String douwnloadUrl = await ref.getDownloadURL();
    docRef.update({
      'images': FieldValue.arrayUnion([douwnloadUrl])
    });
  }

  void toastMaxIamge() {
    Fluttertoast.showToast(
      msg: 'tối đa 4 ảnh',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}
