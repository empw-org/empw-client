import 'package:empw/modules/location_data.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {


  

  Location getCurrentLocation() {
    print("indahouse");
    Location location;
    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager = true;
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .then((position) {
        if (position != null) {
          location.latitude = position.latitude;
          location.longitude = position.longitude;
          //location.place = "whatever now";
        }
      });
    } catch (e) {
      print(e);
    }
return location;
    
}
}