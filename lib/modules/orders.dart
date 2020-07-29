import 'package:flutter/material.dart';

class Order{
  final String id;
  final String distination;
  final String amount;
  final String visa;
  final bool cash;
  

  Order({
    @required this.id,
    @required this.distination,
    @required this.amount,
    this.visa,
    @required this.cash,
   
  });
}

class OrderProvider with ChangeNotifier{
  
}
