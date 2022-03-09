import 'package:aclima_weather/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    // getData();
  }

  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=e5490fa61f15ded1b1f1473444f2a53a'));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactive ');
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}
