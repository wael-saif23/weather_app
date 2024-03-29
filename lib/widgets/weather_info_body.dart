import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModle})
      : super(key: key);
  final WeatherModle weatherModle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getWeatherColor(weatherModle.condition),
        getWeatherColor(weatherModle.condition)[300] ??
            getWeatherColor(weatherModle.condition),
        getWeatherColor(weatherModle.condition)[50] ??
            getWeatherColor(weatherModle.condition),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1)),
              padding: const EdgeInsets.all(16),
              child: Text(
                weatherModle.cityname,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              child: Text(
                'updated at ${weatherModle.date.hour} : ${weatherModle.date.minute} ',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .12,
                    width: MediaQuery.of(context).size.height * .12,
                    child: Image.network(
                      "https:${weatherModle.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    weatherModle.thetemp.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      children: [
                        Text(
                          weatherModle.maxtemp.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          weatherModle.mintemp.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1)),
              padding: const EdgeInsets.all(16),
              child: Text(
                weatherModle.condition,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
