import 'package:weather_app/models/weather_model.dart';

class WeatherStats {}

class WeatherInitialState extends WeatherStats {}

class WeatherloadedState extends WeatherStats {
  final WeatherModle weatherModle;

  WeatherloadedState({required this.weatherModle});
}

class WeatherFailureState extends WeatherStats {
  final String errMassage;

  WeatherFailureState({required this.errMassage});
}
