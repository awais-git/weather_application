import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class HelperFunctions {
  double? latitude;
  double? longitute;

  Future getTheCurrentLocation() async {
  
    try {

      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitute = position.longitude;

      log(latitude.toString());
      log(longitute.toString());
    } catch (e) {
      log('Something went wrong');
    }
  }

  double get getLongitute => longitute!;
  double get getLatitude => latitude!;
}
