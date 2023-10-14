//fetch de weather from the openweather api and return a WeatherModel

import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherGetter {
  Future<WeatherModel> getWeather(double lat, double lon) async {
    //get the weather from the openweather api
    const apiKey = 'API_KEY_HERE'; //api key
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'; //api url with coordinates and api key

    //do a fetch call with the url
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    //get the temp and location from the json and save to varibales
    final temp = json['main']['temp'];
    final location = json['name'];

    //return variables to weather model
    return WeatherModel(
      temp: temp.toInt(),
      location: location,
      description: json['weather'][0]['description'],
    );
  }
}
