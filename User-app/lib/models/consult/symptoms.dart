import 'package:flutter/widgets.dart';

class Symptoms {
  final String name;
  final String imgurl;
  final String category;

  Symptoms({
    @required this.category,
    @required this.imgurl,
    @required this.name,
  });
}
