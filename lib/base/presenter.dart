import 'package:flutter/cupertino.dart';
import 'package:yuru_camp/base/contract.dart';

abstract class Presenter {
  Presenter(this.context, this.view) {
    init();
  }

  final BuildContext context;
  final Contract view;

  void init() {}

  void hideKeyBoard(){
    FocusScope.of(context).unfocus();
  }

  void onBack({value}) {
    Navigator.of(context).pop(value);
  }
  
}
