// ignore_for_file: non_constant_identifier_names, unused_catch_clause, empty_catches

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weathercubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServices) : super(WeatherInitial());
  //
  WeatherServices weatherServices;
  WeatherModel? weather;
  //
  void getWeather({required String CityName}) async {
    emit(WeatherLoding());
    try {
      //
      weather = await weatherServices.getWeather(cityName: CityName);
      emit(WeatherSuccess());
      //
    } on Exception catch (e) {
      emit(WeatherFailuer());
    }
  }
}
