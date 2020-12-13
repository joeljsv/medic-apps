import 'package:flutter/cupertino.dart';

class Doctor {
  final String name;
  final String specialist;
  final String hospital;
  final String experience;
  final String proUrl;
  final String languages;
  final int price;
  final int offerPrice;
  final bool avilable;
  final String id;

  Doctor( {
    @required this.name,
    @required this.specialist,
    @required this.hospital,
    @required this.experience,
    @required this.proUrl,
    @required this.languages,
    @required this.price,
    @required this.offerPrice,
    @required this.avilable,
    @required this.id,
  });
}
