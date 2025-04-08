class WeatherModel {
  final String location;
  final DateTime lastUpdated;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String? weatherImage;
  final String dayCondition;

  const WeatherModel(
      {required this.location,
      required this.lastUpdated,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherImage,
      required this.dayCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        location: json["location"]["name"],
        lastUpdated: DateTime.parse(json["current"]["last_updated"]),
        avgTemp: json["forecast"]['forecastday'][0]["day"]["avgtemp_c"],
        minTemp: json["forecast"]['forecastday'][0]["day"]["mintemp_c"],
        maxTemp: json["forecast"]['forecastday'][0]["day"]["maxtemp_c"],
        weatherImage: json["forecast"]['forecastday'][0]["day"]["condition"]["icon"],
        dayCondition: json["forecast"]['forecastday'][0]["day"]["condition"]["text"]);
  }
}
