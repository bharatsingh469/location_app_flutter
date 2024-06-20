import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as ph;

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  double latitude = 0.0;
  double longitude = 0.0;
  String fullAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Get Current Location",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude=${latitude.toString()}"),
            Text("Longitude=${longitude.toString()}"),
            Text("Address=${fullAddress}"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () async {
                  await requestLocationPermission();
                  await getCurrentLocation();
                },
                child: Text(
                  "Get Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  //for permission
  Future<void> requestLocationPermission() async {
    final ph.PermissionStatus status = await ph.Permission.location.request();
    if (status.isGranted) {
      // Permission granted; you can now retrieve the location.
      print("permission mil gyi h");
    } else if (status.isDenied) {
      // Permission denied.
      print('Location_permission_denied');
    }
  }

//to get current locatioon
  Future<void> getCurrentLocation() async {
    final loc.Location location = loc.Location();
    try {
      final loc.LocationData locationData = await location.getLocation();
      print("Latitude=${locationData.latitude.toString()}");
      print("Longitude=${locationData.longitude.toString()}");
      setState(() {
        latitude = locationData.latitude!;
        longitude = locationData.longitude!;
        getAddress(latitude, longitude);
      });
      // Handle the location data as needed.
    } catch (e) {
      // Handle errors, such as permissions not granted or location services disabled.
      print('Error getting location: $e');
    }
  }
  // get full address based on lonitude n latitude
  getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      String address = "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      print(address);
      setState(() {
        fullAddress = address;
      });
    } catch (e) {
      print('No address available');
    }
  }
}
