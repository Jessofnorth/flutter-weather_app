//get permisson and location from device

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/location_model.dart';

class LocationGetter {
  Future<LocationModel?> getLocation() async {
    //check for permission to get location from device
    PermissionStatus permissionStatus = await Permission.location.request();

    //if permission is granted get the location
    if (permissionStatus.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      return LocationModel(lat: position.latitude, lon: position.longitude);
    } else {
      return null;
    }
  }
}
