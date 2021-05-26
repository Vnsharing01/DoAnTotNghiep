import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/manager_default/mng_df_screen.dart';
import 'package:yuru_camp/screen/manager_your_campsite/mng_your_camp_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class MngCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(''),
        leading: Container(),
      ),
      body:MngYourCampScreen(),
    );
  }
}
