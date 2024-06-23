import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  void requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isDenied || status.isRestricted) {
      if (await Permission.locationWhenInUse.request().isGranted) {
        getLocation();
      } else {
        print('User denied permissions to access the device\'s location.');
      }
    } else {
      getLocation();
    }
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('Dados da posição: $position');
    } catch (e) {
      print('Error obtaining location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            requestLocationPermission();
          },
          child: const Text(
            '🌎 Get location ',
            style: TextStyle(fontFamily: 'Dosis', fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
