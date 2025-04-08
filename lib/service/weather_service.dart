import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseURL = "http://api.weatherapi.com/v1";
  final String apiKey = "7a14dd637276496baf063758250104";

  Future<WeatherModel> getWeather({required String location}) async {
    try {
      final response = await dio
          .get("$baseURL/forecast.json?key=$apiKey&q=$location&days=1");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "oops there was an error, please contact the support and try again later";
      log(e.toString());
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}