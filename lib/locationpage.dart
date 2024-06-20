// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationPage extends StatefulWidget {
//   const LocationPage({super.key});

//   @override
//   State<LocationPage> createState() => _LocationPageState();
// }

// class _LocationPageState extends State<LocationPage> {
//   getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       log("Location permission ni mili h ji ");
//       LocationPermission ask = await Geolocator.requestPermission();
//     } else {
//       Position currentLocation = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);

//       log("Latitude=${currentLocation.latitude.toString()}");
//       log("Longitude=${currentLocation.longitude.toString()}");
//       print("Latitude=${currentLocation.latitude.toString()}");
//       print("Longitude=${currentLocation.longitude.toString()}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Geolocator",
//           style: TextStyle(color: Colors.black12, fontWeight: FontWeight.w200),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               getCurrentLocation();
//             },
//             child: Text("Get Location")),
//       ),
//     );
//   }
// }
