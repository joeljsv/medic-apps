import 'package:flutter/material.dart';

class DoctorDetail {
  final String name;
  final String specialist;
  final String hospital;
  final String experience;
  final String proUrl;
  final String hosUrl;
  final double review;
  final String education;
  final List<String> accademics;
  final String languages;
  final int price;
  final int offerPrice;
  final String noOfCinsultaion;
  final bool avilable;
  final int waitingTime;
  final String id;
  final String description;
  final String hospAddres;
  final String hosDescription;

  DoctorDetail({
   @required this.accademics,
   @required this.name,
   @required this.specialist,
   @required this.hospital,
   @required this.experience,
   @required this.proUrl,
   @required this.hosUrl,
   @required this.review,
   @required this.education,
   @required this.languages,
   @required this.price,
   @required this.offerPrice,
   @required this.noOfCinsultaion,
   @required this.avilable,
   @required this.waitingTime,
   @required this.id,
   @required this.description,
   @required this.hospAddres,
   @required this.hosDescription,
  });
}
