import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_list/camp_area_list/camp_area_list_presenter.dart';

class CampAreaListScreen extends StatefulWidget {
  const CampAreaListScreen({
    Key key,
    this.searchText,
    this.allcampModel,
  }) : super(key: key);

  final String searchText;
  final CampsiteModel allcampModel;

  @override
  _CampAreaListScreenState createState() => _CampAreaListScreenState();
}

class _CampAreaListScreenState extends State<CampAreaListScreen>
    implements Contract {
  CampAreaPresenter _presenter;
  @override
  void initState() {
    _presenter = CampAreaPresenter(
      context,
      this,
      widget.searchText,
      widget.allcampModel,
    );
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
        title: Text('Khu Vực ${widget.searchText}'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child:  _presenter.campList(),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
