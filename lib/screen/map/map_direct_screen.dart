import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'data/place_response.dart';
import 'data/result.dart';
import 'data/error.dart';

class MapDirectScreen extends StatefulWidget {
  const MapDirectScreen({
    Key key,
    this.keyword,
  }) : super(key: key);

  @override
  _MapDirectScreenState createState() => _MapDirectScreenState();
  final String keyword;
}

Completer<GoogleMapController> _controller = Completer();
final CameraPosition _myLocation = CameraPosition(
  target: LatLng(21.023778, 105.8273576),
  zoom: 15,
);

class _MapDirectScreenState extends State<MapDirectScreen> {
  static double latitude = 21.023778;
  static double longitude = 105.8273576;
  String googleApiKey = "AIzaSyCaYPleO-gCUZ-cqi0lrxR4RsIoocK4DuA";

  List<Marker> markers = [];
  bool searching = true;
  List<Result> places;
  Error error;
  static const String baseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  Future<void> searchNearby(double latitude, double longitude) async {
    setState(() {
      markers.clear();
    });

    String url =
        "$baseUrl?key=$googleApiKey&location=$latitude,$longitude&radius=10000&keyword=${widget.keyword}";

    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _handleResponse(data);
    } else {
      throw Exception('Đã xảy ra lỗi khi tìm các địa điểm lân cận');
    }
    // make sure to hide searching
    setState(() {
      searching = false;
    });
  }

  void _handleResponse(data) {
    // bad api key or otherwise
    if (data['status'] == 'REQUEST_DENIED') {
      setState(() {
        error = Error.fromJson(data);
      });
      // success
    } else if (data['status'] == 'OK') {
      setState(() {
        places = PlaceResponse.parseResults(data['results']);
        for (int i = 0; i < places.length; i++) {
          markers.add(Marker(
            onTap: () {},
            markerId: MarkerId(places[i].placeId),
            position: LatLng(places[i].geometry.location.lat,
                places[i].geometry.location.long),
            infoWindow:
                InfoWindow(title: places[i].name, snippet: places[i].vicinity),
          ));
        }
      });
    } else {
      print(data);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _myLocation,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          searchNearby(latitude, longitude);
        },
        label: Text('Places Nearby'),
        icon: Icon(Icons.place),
      ),
    );
  }
}
