import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';

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
              GetWeatherCubit getWeather =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeather.getWeather(cityName: value);
              Navigator.pop(context);
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
