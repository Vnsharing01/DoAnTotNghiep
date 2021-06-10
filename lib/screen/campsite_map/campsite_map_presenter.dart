import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';
import 'package:yuru_camp/model/campsite_model.dart';

class CampsiteMapPresenter extends Presenter {
  CampsiteMapPresenter(BuildContext context, Contract view)
      : super(context, view);
  BitmapDescriptor iconMarker;
  Set<Marker> makers = {};
  CampsiteModel _model;

   CampsiteModel campData ({CampsiteModel model}){
     return _model = CampsiteModel(
      campName: model.campName,
      email: model.email,
      address: model.address,
      area: model.area,
      hotline: model.hotline,
      fanpage: model.fanpage,
      web: model.web,
      intro: model.intro,
      service: model.service,
      personPrice: model.personPrice,
      childPrice: model.childPrice,
      latitude: model.latitude,
      longitude: model.longitude,
      images: model.images,
    );
   }

   @override
  void init() {
    setCustomeMarker();
    super.init();
  }

  void onMapCreated(GoogleMapController controller) {
    makers.add(
      Marker(
        icon: iconMarker,
        markerId: MarkerId('id-1'),
        position: LatLng(_model.latitude, _model.longitude),
        infoWindow: InfoWindow(
          title: _model.campName,
          snippet: _model.address,
        ),
      ),
    );

    debugPrint('tọa độ : ${_model.latitude} - ${_model.longitude} ');
  }

  void setCustomeMarker() async {
    iconMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/icons/ic_campsite_marker.png',
    );
    view.updateSate();
  }
}
