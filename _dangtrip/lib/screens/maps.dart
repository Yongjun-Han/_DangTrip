import 'dart:async';

import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<NaverMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '나의 주변',
      child: NaverMap(
        onMapCreated: _onMapCreated,
        locationButtonEnable: true,
        zoomGestureEnable: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(36.343856, 127.384891),
        ),
      ),
    );
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void _onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}




// class MapProvider with ChangeNotifier {
//   final LocationService _locationService = LocationService();
//   final LocationClass initLocation = LocationService.initLocation;

//   MapProvider(){
//     Future(this.setCurrentLocation);
//   }

//   LocationTrackingMode _trackingMode = LocationTrackingMode.None;
//   LocationTrackingMode get trackingMode => this._trackingMode;
//   set trackingMode(LocationTrackingMode m) => throw "error";

//   Future<void> setCurrentLocation() async {
//     if (await this._locationService.canGetCurrentLocation()){
//       this._trackingMode = LocationTrackingMode.Follow;
//       this.notifyListeners();
//     }
//   }

// }