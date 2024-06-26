import 'package:flutter/material.dart';
import 'package:clima/constants/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late BuildContext _context;
  late Location location;

  @override
  void initState() {
    super.initState();
    location = Location();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _context = context;
      requestLocationPermission();
    });
  }

  Future<void> requestLocationPermission() async {
    await location.requestLocationPermission();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(_context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColorBg,
      body: Center(
        child: SpinKitSpinningLines(
          color: kLightHorizon,
          size: 190.0,
        ),
      ),
    );
  }
}
