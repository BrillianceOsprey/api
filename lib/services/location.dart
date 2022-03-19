import 'package:geolocator/geolocator.dart';

import '../utilities/app_permission.dart';

class Location {
  double? latitude;
  double? longitude;

  // Future<void> getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.low);
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //     print(position);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> getCurrentLocation() async {
    if (await AppPermissions.checkLocationPermission()) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    } else {
      await Geolocator.requestPermission();
    }
  }
}
