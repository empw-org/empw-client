import 'package:flutter/cupertino.dart';

class ContactUSData {
  String name;
  String email;
  String message;


  ContactUSData({
   @required this.name,
    @required this.email,
    @required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "name" : name,
      "email": email,
      "message" : message,
      "from": "WEB"
    };
  }
}
