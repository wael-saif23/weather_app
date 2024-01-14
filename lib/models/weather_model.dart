class WeatherModle {
  final String cityname;
  final DateTime date;
  final String image;
  final double thetemp;
  final double maxtemp;
  final double mintemp;
  final String condition;

  const WeatherModle({
    required this.cityname,
    required this.date,
    required this.image,
    required this.thetemp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
  });

  factory WeatherModle.json(json) {
    return WeatherModle(
      cityname: json["location"]['name'],
      date: json["location"]['localtime'],
      image: json["forecast"][0]['day']['condition']['icon'],
      thetemp: json["forecast"][0]['day']['avgtemp_c'],
      maxtemp: json["forecast"][0]['day']['maxtemp_c'],
      mintemp: json["forecast"][0]['day']['mintemp_c'],
      condition: json["forecast"][0]['day']['condition']['text'],
    );
  }
}
