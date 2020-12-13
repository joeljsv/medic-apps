import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget noti(BuildContext context) {
  return GestureDetector(
    
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(Icons.notifications_active),
    ),
  );
}
