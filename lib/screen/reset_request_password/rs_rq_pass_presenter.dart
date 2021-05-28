import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';

class RsRqPassPresenter extends Presenter {
  RsRqPassPresenter(BuildContext context, Contract view) : super(context, view);
  final emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  
  
  void send() {
    _auth.sendPasswordResetEmail(email: emailController.text);
    Navigator.of(context).pop();
    view.updateSate();
  }
}
