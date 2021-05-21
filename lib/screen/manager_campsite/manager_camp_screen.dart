import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/manager_default/mng_df_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class MngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
      ),
      body:DfMngCampScreen(),
    );
  }
}
