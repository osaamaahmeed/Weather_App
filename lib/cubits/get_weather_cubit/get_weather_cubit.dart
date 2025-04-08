import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(): super(WeatherInitialState());
  WeatherModel? weatherData;
  getWeather({required String location}) async {
    try {
      weatherData =
          await WeatherService().getWeather(location: location);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailerState(errorMesage: e.toString()));
    }
  }
}
