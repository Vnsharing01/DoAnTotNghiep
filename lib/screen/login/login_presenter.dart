import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/screen/reset_request_password/reset_request_password_screen.dart';
import 'package:yuru_camp/screen/singup/singup_screen.dart';

import 'login_api_client.dart';

class LoginPresenter extends Presenter {
  LoginPresenter(BuildContext context, Contract view) : super(context, view);

  LoginApiClient _apiClient = LoginApiClient();

  // controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// chuyển màn sang đặt lại mật khẩu
  void nextResetPass() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RequestPasswordScreen(),
      ),
    );
  }

  login({String email, String pass}) {
    _apiClient.loginUser(
      context: context,
      email: email,
      password: pass,
    );
  }

  /// đăng nhập bằng google
  void loginWithGG() {
    _apiClient.googleSignIn(context);
  }

  void createAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
    );
  }
}
