class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFailerState extends WeatherState {
  final String errorMesage;
  WeatherFailerState({required this.errorMesage});
}
