import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite.dart';
import 'package:yuru_camp/screen/campsite_list/camp_area_list/camp_area_list_presenter.dart';
import 'package:yuru_camp/screen/campsite_list/item_camp_list_view.dart';

class CampAreaListScreen extends StatefulWidget {
  const CampAreaListScreen({
    Key key,
    this.area,
  }) : super(key: key);

  final String area;

  @override
  _CampAreaListScreenState createState() => _CampAreaListScreenState();
}

class _CampAreaListScreenState extends State<CampAreaListScreen>
    implements Contract {
  CampAreaPresenter _presenter;
  @override
  void initState() {
    _presenter = CampAreaPresenter(context, this);
    super.initState();
  }

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
        title: Text('Khu Vực ${widget.area}'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: _presenter.listCamp(widget.area),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
