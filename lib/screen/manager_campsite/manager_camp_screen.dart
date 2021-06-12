import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/manager_campsite/manager_camp_presenter.dart';
import 'package:yuru_camp/screen/manager_default/mng_df_screen.dart';
import 'package:yuru_camp/screen/manager_your_campsite/mng_your_camp_screen.dart';
import 'package:yuru_camp/styles/color.dart';

class MngCampScreen extends StatefulWidget {
  @override
  _MngCampScreenState createState() => _MngCampScreenState();
}

class _MngCampScreenState extends State<MngCampScreen> implements Contract {
  ManagerCampPresenter _presenter;

  @override
  void initState() {
    _presenter = ManagerCampPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(''),
        leading: Container(),
      ),
      body: _presenter.mngModel?.campName == null ||
              _presenter.mngModel.campName.isEmpty
          ? DfMngCampScreen()
          : MngYourCampScreen(),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
