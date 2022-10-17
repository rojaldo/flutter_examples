import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({Key? key}) : super(key: key);

  @override
  _GeolocationPageState createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
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

  Position _position = Position(
      latitude: 0.0,
      longitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);

  _onPressed() async {
    Position position = await _determinePosition();
    print('position: $position');
    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _onPressed, child: const Text('Geolocation')),
            Text('latitude: ${_position.latitude}',
                style: const TextStyle(fontSize: 20)),
            Text('longitude: ${_position.longitude}',
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
