

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  Position? _currentPosition;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();
  }
  Future<void> _openInGoogleMaps(double latitude, double longitude) async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Location')
      ),
      body: Column(
        children: [

      Center(
      child: _currentPosition == null
      ? Text('Press the button to get your location')
          : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           Text(
              'Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}'),

        SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {
            _openInGoogleMaps(_currentPosition!.latitude, _currentPosition!.longitude);
          },
          child: Text('Google Maps'),

        ),

      ],

    ),
    ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await _determinePosition();
          setState(() {
            _currentPosition = position;
          });
        },
        tooltip: 'Get Location',
        child: Icon(Icons.location_on),
      ),

    );
  }
}
