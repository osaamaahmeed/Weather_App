import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherData?.dayCondition),
                  useMaterial3: false,
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          );
        }));
  }
}

// class customMatrialApp extends StatelessWidget {
//   const customMatrialApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: getThemeColor(
//           BlocProvider.of<GetWeatherCubit>(context).weatherData?.dayCondition
//         ),
//         useMaterial3: false,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: HomeView(),
//     );
//   }
// }

MaterialColor getThemeColor(String? condition) {
  switch (condition?.toLowerCase().trim()) {
    case "sunny":
      return Colors.yellow;
    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.grey;
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey;
    case "patchy rain possible":
    case "patchy rain nearby":
    case "patchy light drizzle":
    case "light drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.blue;
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "blowing snow":
    case "blizzard":
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "light snow showers":
    case "moderate or heavy snow showers":
      return Colors.lightBlue;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;
    case "ice pellets":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.teal;
    case "light sleet showers":
    case "moderate or heavy sleet showers":
      return Colors.indigo;
    default:
      return Colors.deepPurple;
  }
}
