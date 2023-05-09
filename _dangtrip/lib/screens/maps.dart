import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '나의 주변',
      child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0))),
    );
  }
}
