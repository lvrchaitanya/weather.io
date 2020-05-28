

import 'package:clima/services/networking.dart';

import 'package:clima/services/location.dart';

const apikey ='25ce20a67c9d2c5c8c749ac15c07878c';



class WeatherModel {

  double lat,lon;

  Future<dynamic> getCityWeather(String cityName) async {
    Networking networkHelper = Networking( url:
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getloc();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.GetCurrentocation();
    lat = location.lat;
    lon = location.long;
    Networking net = Networking(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');

    final jd = await net.getloc();
     return jd;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
