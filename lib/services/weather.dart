import 'location.dart';
import 'networking.dart';

// const apiKey = "4232afa01405fb806311dff86dc0143a";
const apiKey = "4232afa01405fb806311dff86dc0143a";
const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  //ByCity by typing
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$baseUrl?q=$cityName&appid=$apiKey&units=metric'; //units metric cal c and f
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  //location u mal
  Future<dynamic> getLocationWeather() async {
    Location location = Location(); //object new
    await location
        .getCurrentLocation(); // ak htle mha (locacation.getCurrentLocation()) lox pyan cal

    NetworkHelper networkHelper = NetworkHelper(
      '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // weather icons by condition
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

//weather message by temp
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
