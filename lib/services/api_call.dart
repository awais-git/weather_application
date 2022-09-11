import 'dart:developer';

import 'package:dio/dio.dart';
import '../utilities/const.dart';

class WeatherApi {
  Future getWeatherDetails() async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(
          'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=$weatherApiKey');

      // log(response.toString());
    } catch (e) {
      log('There is a error');
    }
  }
}
