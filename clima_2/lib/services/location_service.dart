import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Future<Position?> getCurrentLocation() async {
    try {
      final status = await Permission.locationWhenInUse.status;

      if (status.isDenied || status.isRestricted) {
        final result = await Permission.locationWhenInUse.request();
        if (!result.isGranted) {
          print('Location permission denied.');
          return null;
        }
      }

      if (!await Geolocator.isLocationServiceEnabled()) {
        print('Location services are disabled.');
        return null;
      }

      const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 50,
        // Só atualiza se mover x metros
        timeLimit: Duration(seconds: 30), // Timeout de x segundos
      );

      return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
    } on TimeoutException catch (e) {
      print('Timeout obtaining location: $e');
      return null;
    } catch (e) {
      print('Error obtaining location: $e');
      return null;
    }
  }
}
