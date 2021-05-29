import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';

import 'package:yuru_camp/screen/reset_request_password/reset_request_password_screen.dart';
import 'package:yuru_camp/screen/singup/singup_screen.dart';

import 'login_api_client.dart';

class LoginPresenter extends Presenter {
  LoginPresenter(BuildContext context, Contract view) : super(context, view);
  bool hidePass = true;

  LoginApiClient _apiClient = LoginApiClient();

  // controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final dynamic emailKey = GlobalKey();
  final dynamic passKey = GlobalKey();

  /// chuyển sang màn đặt lại mật khẩu
  void nextResetPass() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RequestPasswordScreen(),
      ),
    );
  }

  /// đăng nhập với email&password
  login() async {
    if (valid) {
      try {
        _apiClient.loginUser(
          context: context,
          email: emailController.text.trim(),
          password: passwordController.text,
        );
      } catch (e, stack) {
        view.updateSate();
        debugPrint('$e, $stack');
      }
    }
  }

  /// đăng nhập bằng google
  void loginWithGG() {
    _apiClient.googleSignIn(context);
  }

  /// tạo tài khoản mới
  void createAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
    );
  }

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

  List get keys => [
        emailKey,
        passKey,
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
