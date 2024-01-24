import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_stats.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStats> {
  GetWeatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    try {
      WeatherModle weatherModle =
          await WeatherServic(dio: Dio()).getWeather(cityName: cityName);
      emit(WeatherloadedState(weatherModle: weatherModle));
    } catch (e) {
      emit(WeatherFailureState(errMassage: e.toString()));
    }
  }
}
