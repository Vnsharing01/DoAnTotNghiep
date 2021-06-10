import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/screen/campsite_map/campsite_map_presenter.dart';

class CampsiteMapScreen extends StatefulWidget {
  const CampsiteMapScreen({
    Key key,
    this.model,
  }) : super(key: key);

  final CampsiteModel model;

  @override
  _CampsiteMapScreenState createState() => _CampsiteMapScreenState();
}

class _CampsiteMapScreenState extends State<CampsiteMapScreen> implements Contract {
  CampsiteMapPresenter _presenter;

  @override
  void initState() {
    _presenter = CampsiteMapPresenter(context, this);
    _presenter.campData(model: widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: _presenter.onBack,
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
        title: Text('bản đồ'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _presenter.onMapCreated,
        markers: _presenter.makers,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.model.latitude, widget.model.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
