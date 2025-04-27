import 'package:clima_2/services/location_service.dart';
import 'package:clima_2/services/networking_service.dart';
import 'package:flutter/cupertino.dart';

const apiKey = 'fxxx';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  Future<dynamic> getCityWeather(String cityName) async {
    try {
      final url = Uri.parse(
          "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
      final networkingService = NetWorkingService(url);
      final weatherData = await networkingService.getData();
      return weatherData;
    } catch (e) {
      debugPrint('Error fetching city weather: $e');
      return null;
    }
  }

  Future<dynamic> getLocationWeather({double? latitude, double? longitude}) async {
    try {
      double lat;
      double lon;

      if (latitude != null && longitude != null) {
        lat = latitude;
        lon = longitude;
      } else {
        final position = await LocationService.getCurrentLocation();
        if (position == null) {
          debugPrint('Error getting location');
          return null;
        }
        lat = position.latitude;
        lon = position.longitude;
      }

      final url = Uri.parse(
          '$openWeatherMapURL?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
      final networkingService = NetWorkingService(url);

      final weatherData = await networkingService.getData();
      return weatherData;
    } catch (e) {
      debugPrint('Error fetching location weather: $e');
      return null;
    }
  }


  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return Image.asset('images/Thunderstorm.png',height: 120, width: 150,);
    } else if (condition < 400) {
      return Image.asset('images/Rain.png',height: 120, width: 120,);
    } else if (condition < 600) {
      return Image.asset('images/LightRain.png',height: 120, width: 150,);
    } else if (condition < 700) {
      return Image.asset('images/Snow.png',height: 110, width: 110,);
    } else if (condition < 800) {
      return Image.asset('images/Clouds.png',height: 110, width: 110,);
    } else if (condition == 800) {
      return Image.asset('images/Clear.png',height: 150, width: 150,);
    } else if (condition <= 804) {
      return Image.asset('images/Clouds.png',height: 120, width: 150,);
    } else {
      return Image.asset('images/404.png',height: 120, width: 150,);
    }
  }

  String getMessage(int temp) {
    if (temp > 29) {
      return 'Today we have 🍦 \nBecause it\'s hot';
    } else if (temp > 25) {
      return 'Today you can wear shorts and a 👕 \nBecause the weather is nice';
    } else if (temp < 17) {
      return 'It\'s chilly ❄️ \nyou\'ll need 🧣 and 🧤';
    } else {
      return 'Better take a 🧥, just in case \nBecause the weather is strange';
    }
  }
}
