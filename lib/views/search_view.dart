import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModle weatherModle =
                  await WeatherServic(dio: Dio()).getWeather(cityName: value);
              log(weatherModle.cityname);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 34),
              suffixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(196, 121, 190, 248),
              ),
              labelText: "Search",
              hintText: "City Name",
              hintStyle: TextStyle(color: Color.fromARGB(196, 121, 190, 248)),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
