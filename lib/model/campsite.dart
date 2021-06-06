class CampsiteModel {
  final String email;
  final String campName;
  final String address;
  final String area;
  final int hotline;
  final String fanpage;
  final String web;
  final String intro;
  final String service;
  final int personPrice;
  final int childPrice;
  final double latitude;
  final double longitude;
  List images = [];

  CampsiteModel({
    this.email,
    this.campName,
    this.address,
    this.area,
    this.hotline,
    this.fanpage,
    this.web,
    this.intro,
    this.service,
    this.personPrice,
    this.childPrice,
    this.latitude,
    this.longitude,
    this.images,
  });
}
