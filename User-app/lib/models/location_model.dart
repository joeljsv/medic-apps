import 'dart:ffi';

import 'package:flutter/widgets.dart';

class Location_mod {
  String name;
  String address;
  double lat;
  double long;
  bool isaval;

  Location_mod({
    this.isaval=false,
    @required this.name,
    @required this.address,
    @required this.lat,
    @required this.long,
  });
}
