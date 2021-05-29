import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/login/login_screen.dart';
import 'package:yuru_camp/screen/singup/signup_presenter.dart';
import 'package:yuru_camp/screen/singup/text_feild_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> implements Contract{
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
      body: Container(
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
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      /// email
                      TextFeildView(
                        controller: _presenter.mailController,
                        hintText: 'Email',
                        icon: Icon(Icons.mail),
                      ),

                      /// user name
                      TextFeildView(
                        controller: _presenter.usernameController,
                        hintText: 'Username',
                        icon: Icon(Icons.person),
                      ),

                      /// password
                      TextFeildView(
                        controller: _presenter.passwordController,
                        hintText: 'Password',
                        icon: Icon(Icons.lock),
                        typePassword: true,
                      ),

                      // /// confirm Cotntrole
                      // TextFeildView(
                      //   controller: _presenter.confimController,
                      //   hintText: 'Confirm Password',
                      //   icon: Icon(Icons.shield),
                      // ),
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
    );
  }

  @override
  void updateSate() {
    // TODO: implement updateSate
  }
}
