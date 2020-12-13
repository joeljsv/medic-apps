import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/location_model.dart';

class LocationProvider with ChangeNotifier {
  Location_mod location = Location_mod(lat: 0, address: "", long: 0, name: "");

  Future<Location_mod> getLocation() async {
    try {
      await PermissionHandler().requestPermissions(
        [PermissionGroup.location],
      );

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          

      final coordinates =
          new Coordinates(position.latitude, position.longitude);
      final addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      final first = addresses.first;
      location = Location_mod(
        name: first.featureName,
        address: first.addressLine,
        lat: position.latitude,
        long: position.longitude,
        isaval: true,
      );
      return location;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
