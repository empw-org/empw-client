import 'package:geolocator/geolocator.dart';

/// usage
///  Location location = Location();
///  await location.getCurrentLocation();
class Location {
  double latitude;
  double longitude;
  String address;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentAdress() async {
    try {
      List<Placemark> p =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];
      address = "${place.locality}Ismailia, ${place.country}";
    } catch (e) {
      print(e);
    }
  }
}
