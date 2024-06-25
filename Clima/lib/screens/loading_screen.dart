import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;

  @override
  void initState() {
    super.initState();
    location = Location();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    await location.requestLocationPermission();
  }

  Future<void> getLocation() async {
    await location.getCurrentPosition();
  }

  void getData() async {
    double? latitude = location.latitude;
    double? longitude = location.longitude;
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '$latitude',
        'lon': '$longitude',
        'appid': 'fcd6d71598a09bf97ac04d15dc4e4c85',
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('🟢🟢🟢🟢🟢 Status 200 - OK 🟢🟢🟢🟢🟢');
      print(response.body);
    } else {
      print(
          '🟡🟡🟡🟡🟡- Request failed with status: ${response.statusCode} 🟡🟡🟡🟡🟡');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            requestLocationPermission();
            getLocation();
          },
          child: const Text(
            '🌎 Get location ',
            style: TextStyle(
                fontFamily: 'Dosis',
                fontSize: 23.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
