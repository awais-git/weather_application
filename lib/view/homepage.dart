
import 'package:flutter/material.dart';
import 'package:weather_application/services/api_call.dart';
import 'package:weather_application/services/helper.functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var weatherApi = WeatherApi();
  var helperFunctions = HelperFunctions();

  @override
  void initState() {
    weatherApi.getWeatherDetails();
    helperFunctions.getTheCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
