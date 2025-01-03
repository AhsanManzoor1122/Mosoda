import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6226256, 72.9880340), zoom: 14.4746);
  List<Marker> marker = [];
  List<Marker> markerlist = [
    Marker(markerId: MarkerId("1"), position: LatLng(33.6226256, 72.9880340)),
  ];
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    marker.addAll(markerlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        // compassEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(marker),
      ),
    );
  }
}
