import 'package:yuru_camp/screen/home/home_screen.dart';
import 'package:yuru_camp/screen/login/login_api_client.dart';
import 'package:yuru_camp/screen/singup/singup_screen.dart';
import 'package:yuru_camp/screen/login/view/login_text_feild_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'view/login_text_view.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginApiClient _apiClient = LoginApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        leading: Container(),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_backgound.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        TextFeildView(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: Icon(Icons.person_outline),
                        ),
                        TextFeildView(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icon(Icons.lock_outline),
                          typePassword: false,
                        ),
                        LoginTextView(
                          text: 'Quên mật khẩu?',
                          color: Colors.red,
                          align: TextAlign.right,
                          press: () {},
                        ),
                        Container( // btn login
                          child: FlatButton(
                            onPressed: () {
                              _apiClient.loginUser(
                                context: context,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                        ),
                        Container( // divider
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(child: Divider(color: Colors.black)),
                              Text('OR'),
                              Expanded(child: Divider(color: Colors.black)),
                            ],
                          ),
                        ),
                        Container( // login with google 
                          margin: EdgeInsets.all(20),
                          child: TextButton.icon(
                            onPressed: () {
                              _apiClient.googleSignIn(context);
                            },
                            icon: Image(
                              image: AssetImage('assets/icons/ic_google.png'),
                              width: 36,
                              height: 36,
                            ),
                            label: Text(
                              'Login with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  fontSize: 16),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        LoginTextView(
                          text: 'Tạo tài khoản mới!',
                          color: Colors.green,
                          align: TextAlign.center,
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
