import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
// API Sorocaba/Brazil LINK: https://api.openweathermap.org/data/2.5/weather?lat=-23.4213536&lon=-47.4624792&appid=fcd6d71598a09bf97ac04d15dc4e4c85
class Location {
  double? latitude;
  double? longitude;

  Future<void> requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isDenied || status.isRestricted) {
      if (await Permission.locationWhenInUse.request().isGranted) {
        await getCurrentPosition();
      } else {
        print('User denied permissions to access the device\'s location.');
      }
    } else {
      await getCurrentPosition();
    }
  }

  Future<void> getCurrentPosition() async {
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
