// import 'package:flutter/material.dart';
// import 'package:mosoda/Resources/Components/Button.dart';
// import 'package:mosoda/Resources/Components/theme_data.dart';

// class AddLocationScreen extends StatefulWidget {
//   const AddLocationScreen({super.key});

//   @override
//   State<AddLocationScreen> createState() => _AddLocationScreenState();
// }

// class _AddLocationScreenState extends State<AddLocationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Add"),
//       ),
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         child: Column(
//           children: [
//             ButtonMain(
//                 buttonBorderColor: AppTheme.backgroundColor,
//                 buttonColor: AppTheme.fillColor,
//                 child: Text("Add Location"),
//                 onTap: () {
//                   Navigator.pushNamed(context, "LocationScreen");
//                 },
//                 textColor: Colors.black)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  late GoogleMapController _controller;
  LatLng _currentPosition =
      const LatLng(37.7749, -122.4194); // Default to San Francisco
  String _selectedAddress = "Move the map to select a location";

  // Update address based on coordinates
  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      setState(() {
        _selectedAddress =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        _selectedAddress = "Error retrieving address";
      });
    }
  }

  // Trigger when map stops moving
  void _onCameraIdle() async {
    LatLng center = await _controller.getLatLng(ScreenCoordinate(
      x: MediaQuery.of(context).size.width ~/ 2,
      y: MediaQuery.of(context).size.height ~/ 2,
    ));
    await _getAddressFromLatLng(center);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              _controller = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14.0,
            ),
            onCameraMove: (position) {
              _currentPosition = position.target;
            },
            onCameraIdle: _onCameraIdle,
          ),
          // Crosshair
          const Center(
            child: Icon(
              Icons.location_on,
              size: 40,
              color: Colors.red,
            ),
          ),
          // Address Display
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _selectedAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, _currentPosition);
                  },
                  child: const Text("Select This Location"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
