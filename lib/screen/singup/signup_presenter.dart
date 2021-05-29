import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/screen/singup/signup_api_client.dart';

class SignupPresenter extends Presenter {
  SignupPresenter(BuildContext context, Contract view) : super(context, view);

    //EditText controller
  final mailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confimController = TextEditingController();

  SignUpApiClient _apiClient = SignUpApiClient();

  createAccount() async{
    _apiClient.signUpUser(
      email: mailController.text,
      psw: passwordController.text,
      name: usernameController.text,
      context: context,
    );
  }

}