import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isDenied || status.isRestricted) {
      if (await Permission.locationWhenInUse.request().isGranted) {
        await getCurrentLocation();
      } else {
        print('User denied permissions to access the device\'s location.');
      }
    } else {
      await getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error obtaining location: $e');
    }
  }
}