import 'package:aclima_weather/screens/location_screen.dart';
import 'package:aclima_weather/services/location.dart';
import 'package:aclima_weather/services/networking.dart';
import 'package:aclima_weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// const apiKey = '4232afa01405fb806311dff86dc0143a';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    // getData();
  }

// https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=4232afa01405fb806311dff86dc0143a
  // void getLocationData() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();

  //   NetworkHelper networkHelper = NetworkHelper(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

  //   var weatherData = await networkHelper.getData();
  //   print(weatherData);

  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return LocationScreen(
  //       locationWeather: weatherData,
  //     );
  //   }));
  // }
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();//new obj weather htle ka getLocationWeather
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
