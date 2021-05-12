import 'package:flutter/material.dart';

class MngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
        title: Text('ABC Camp'),
        centerTitle: true,
      ),
      body: Container(),
      
    );
  }
}