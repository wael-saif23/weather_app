import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServic {
  final Dio dio;
  final String apiKey = "1c077df282f14e8f9ae131515231802";
  final String apiBase = "http://api.weatherapi.com/v1";

  WeatherServic({required this.dio});
  Future<WeatherModle?> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$apiBase/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModle weatherData = WeatherModle.fromjson(response.data);

      return weatherData;
    } on DioException catch (e) {
      final String errMassage = e.response?.data["error"]["message"] ??
          "oops there was an error , try later";
      throw Exception(errMassage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error , try later");
    }
  }
}
