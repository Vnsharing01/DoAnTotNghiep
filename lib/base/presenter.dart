import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuru_camp/base/contract.dart';

abstract class Presenter {
  Presenter(this.context, this.view) {
    init();
  }

  final BuildContext context;
  final Contract view;

  void init() {}

  void hideKeyBoard() {
    FocusScope.of(context).unfocus();
  }

  void onBack({value}) {
    Navigator.of(context).pop(value);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User inputData() {
    final User user = auth.currentUser;
    final email = user.email;
    print('navigation : $email');
    return user;
  }
}
