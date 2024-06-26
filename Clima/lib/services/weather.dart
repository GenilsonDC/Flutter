import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'fcd6d71598a09bf97ac04d15dc4e4c85';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
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
