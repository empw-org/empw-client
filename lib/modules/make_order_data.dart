import 'package:empw/services/location_services.dart';

class MakeOrderData{
  String amount;
  Location location;

  MakeOrderData({this.amount, this.location});

  Map<String, dynamic> toJson() {
    return {
      "amount": int.parse(amount),
      "location": {
        "latitude": location.latitude,
        "longitude": location.longitude
      }
    };
  }

}
