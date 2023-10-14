import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/location_model.dart';
import '../models/weather_model.dart';
import '../services/get_location.dart';
import '../services/get_weather.dart';

//page displayin the weather of the current location
//create state for page
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  @override
  State<StatefulWidget> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  //get data from models
  LocationModel? location;
  WeatherModel? weather;

  @override
  //get the location and weather and initialize the state
  void initState() {
    super.initState();
    getData();
  }

  //get the location and weather from API

  Future<void> getData() async {
    //get the coordinates from device
    location = await LocationGetter().getLocation();

    //Use coordinates to get the weather from API if there is a location
    if (location != null) {
      weather = await WeatherGetter().getWeather(location!.lat, location!.lon);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Page'),
      ),
      //display the data on the screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weather != null)
              Text(' ${weather!.temp}°C',
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (weather != null)
              Text(weather!.description.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 50),
            if (weather != null)
              Text(weather!.location,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline)),
          ],
        ),
      ),
      //bottomnav with routes
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          )
        ],
        //set current index to get different color on navbar for current page
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/'); //go to weather page
              break;
            case 1:
              context.go('/about'); //go to about page
              break;
          }
        },
      ),
    );
  }
}
