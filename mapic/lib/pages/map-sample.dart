import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> marked = [];
  Map<String, dynamic> _address = {
    'latitutde': 0.00,
    'longtitude': 0.00,
    'address': ''
  };

  List<Placemark>? placeMarks;
  String place = '';

  //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Map')
      ),
      body: Column(
          children: <Widget>[
            Align(
              child: Container(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set.from(marked),
                  onTap: _handleTap
                ),
                width: 480,
                height: 480,
              ),
            ),
            Text(
              place,

            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal
              ),
              onPressed: () {
                Navigator.of(context).pop(_address);
              },
              child: Text('save', style: TextStyle(color: Colors.white))
            ),
          ]
      )
    );
  }

  _handleTap(LatLng tappedPoint) async {
    print(tappedPoint);
    setState(() {
      marked = [];
      marked.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint
        )
      );
    });
    placeMarks = await placemarkFromCoordinates(tappedPoint.latitude, tappedPoint.longitude, localeIdentifier: 'ja_JP');
    place = placeMarks![1].street.toString();
    _address['latitude'] = tappedPoint.latitude;
    _address['longtitude'] = tappedPoint.longitude;
    _address['address'] = place;

    //print(placeMarks);
    print(placeMarks![1].street);
  }

}
