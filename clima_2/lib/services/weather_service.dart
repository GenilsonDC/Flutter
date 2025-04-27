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


  Widget getWeatherIcon(int condition, String weatherIcon) {
    if (condition < 300 ) {
      return Image.asset('images/11d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    }
    else if (condition < 400) {
      return Image.asset('images/09d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition < 600 && weatherIcon == '10d') {
      return Image.asset('images/10d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    }  else if (condition < 600 && weatherIcon == '10n') {
      return Image.asset('images/10n@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    }else if (condition < 700) {
      return Image.asset('images/13d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition < 800) {
      return Image.asset('images/50d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition == 800 && weatherIcon == '01d') {
      return Image.asset('images/01d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition == 800 && weatherIcon == '01n') {
      return Image.asset('images/01n@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition == 801 && weatherIcon == '02d') {
      return Image.asset('images/02d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition == 801 && weatherIcon == '02n') {
      return Image.asset('images/02n@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else if (condition == 802) {
      return Image.asset('images/03d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    }   else if (condition <= 804) {
      return Image.asset('images/04d@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    } else {
      return Image.asset('images/404@2x.png',height: 150,  width: 150, fit: BoxFit.cover,);
    }
  }

  String getMessage(int temp) {
    if (temp > 29) {
      return 'Today we have 🍦 \nBecause it\'s hot';
    } else if (temp > 25) {
      return 'Today you can wear 🩳 and a 👕 \nBecause the weather is nice';
    } else if (temp < 17) {
      return 'It\'s chilly ❄️ \nyou\'ll need 🧣 and 🧤';
    } else {
      return 'Better take a 🧥, just in case \nBecause the weather is strange';
    }
  }
}
