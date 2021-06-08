import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/validators.dart';
import 'package:yuru_camp/screen/login/login_screen.dart';
import 'package:yuru_camp/screen/singup/signup_presenter.dart';

import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/login_signup_feild_view.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> implements Contract {
  SignupPresenter _presenter;

  @override
  void initState() {
    _presenter = SignupPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: _presenter.hideKeyBoard,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/signup_backgound.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'SignUp',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        /// email
                        LoginSignupTxtFView(
                          key: _presenter.emailKey,
                          controller: _presenter.mailController,
                          hintText: 'Email',
                          icon: Icon(Icons.mail),
                          validator: Validators.emailValidator,
                        ),

                        /// user name
                        LoginSignupTxtFView(
                          key: _presenter.nameKey,
                          controller: _presenter.usernameController,
                          hintText: 'Username',
                          icon: Icon(Icons.person),
                          validator: Validators.nameValidator,
                        ),

                        /// password
                        LoginSignupTxtFView(
                          key: _presenter.passKey,
                          controller: _presenter.passwordController,
                          hintText: 'Password',
                          icon: Icon(Icons.lock),
                          typePassword: _presenter.hidePass,
                          showPass: IconButton(
                            icon: _presenter.showPassIcon(),
                            onPressed: _presenter.showPass,
                          ),
                          validator: Validators.passValidator,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: _presenter.createAccount,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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

  @override
  void updateSate() {
    setState(() {});
  }
}
