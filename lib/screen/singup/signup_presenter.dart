import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/screen/login/login_screen.dart';
import 'package:yuru_camp/screen/singup/signup_api_client.dart';

class SignupPresenter extends Presenter {
  SignupPresenter(BuildContext context, Contract view) : super(context, view);

  bool hidePass = true;

  //EditText controller
  final mailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confimController = TextEditingController();

  final dynamic emailKey = GlobalKey();
  final dynamic passKey = GlobalKey();
  final dynamic nameKey = GlobalKey();

  SignUpApiClient _apiClient = SignUpApiClient();

  Widget showPassIcon() {
    if (hidePass == true) {
      return Icon(Icons.remove_red_eye_rounded);
    } else {
      return Icon(Icons.remove_red_eye_outlined);
    }
  }

  void showPass() {
    if (hidePass == true) {
      hidePass = false;
      view.updateSate();
    } else {
      hidePass = true;
      view.updateSate();
    }
  }

  /// đăng kí với email&password
  createAccount() async {
    if (valid) {
      try {
        _apiClient.signUpUser(
          email: mailController.text.trim(),
          psw: passwordController.text,
          name: usernameController.text,
          context: context,
        );
        
      } catch (e, stack) {
        view.updateSate();
        debugPrint('$e, $stack');
      }
    }
  }

  List get keys => [
        emailKey,
        passKey,
        nameKey,
      ];

  bool get valid {
    hideKeyBoard();
    bool _valid = true;
    keys.forEach((element) {
      if (element.currentState != null &&
          !element.currentState.checkValidate()) {
        _valid = false;
      }
    });
    return _valid;
  }
}
