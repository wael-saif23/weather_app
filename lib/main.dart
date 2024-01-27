import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_stats.dart';

import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherStats>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModle
                        ?.condition),
                appBarTheme: AppBarTheme(
                  color: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModle
                          ?.condition),
                ),
              ),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  } else {
    switch (weatherCondition) {
      case 'Sunny':
        return Colors.yellow;
      case 'Partly cloudy':
      case 'Thundery outbreaks possible':
        return Colors.orange;
      case 'Cloudy':
      case 'Fog':
      case 'Freezing fog':
        return Colors.grey;
      case 'Overcast':
        return Colors.blueGrey;
      case 'Mist':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Patchy rain nearby':
        return Colors.lightBlue;
      case 'Patchy rain possible':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
        return Colors.lightGreen;
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Blowing snow':
      case 'Blizzard':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Ice pellets':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.grey;
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
        return Colors.deepPurple;
      default:
        return Colors.blue;
    }
  }
}
