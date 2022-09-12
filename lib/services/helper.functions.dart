import 'dart:async';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/model/user_location.model.dart';

class HelperFunctions {
  HelperFunctions() {
    locationStream = Geolocator.getPositionStream().listen((postionStream) {
      userLocationController.add(UserLocationModel(
          latitude: postionStream.latitude,
          longitute: postionStream.longitude));
    });
  }

  UserLocationModel? _userLocationModel;
  Position? _currentPosition;
  final Geolocator _geolocator = Geolocator();
  StreamSubscription<Position>? locationStream;
  StreamController<UserLocationModel> userLocationController =
      StreamController<UserLocationModel>();

  Stream<UserLocationModel> get getLocationStream =>
      userLocationController.stream;

  //close the stream if nothing
  void closeLocationStream() {
    if (locationStream == null) {
      locationStream!.cancel();
      userLocationController.close();

      locationStream = null;
    } else {}
  }

  Future<UserLocationModel> getTheCurrentLocation() async {
    try {
      //service enabled
      var isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        isLocationEnabled = await Geolocator.isLocationServiceEnabled();
        if (!isLocationEnabled) {
          throw Exception('Location service is not enabled');
        }
      }

      //check for th permission
      var checkPermission = await Geolocator.checkPermission();
      if (checkPermission == LocationPermission.denied ||
          checkPermission == LocationPermission.deniedForever) {
        checkPermission = await Geolocator.requestPermission();
      }

      //if both the location and permission enabled
      if (isLocationEnabled &&
          checkPermission == LocationPermission.always &&
          checkPermission == LocationPermission.whileInUse) {
        _currentPosition = await Geolocator.getCurrentPosition().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw TimeoutException(
                "Location information could not be obtained within the requested time.");
          },
        );
        _userLocationModel = UserLocationModel(
            latitude: _currentPosition!.latitude,
            longitute: _currentPosition!.longitude);
        return _userLocationModel!;
      } else {
        throw Exception("Location Service requests has been denied!");
      }
    } on TimeoutException catch (_) {
    } catch (e) {
      log('Something went wrong');
    }

    return _userLocationModel!;
  }
}
