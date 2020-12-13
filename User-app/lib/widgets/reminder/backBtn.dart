import 'package:flutter/material.dart';
import 'package:medic_app/theme/theme.dart';


class MyBackButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
        child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
          child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: AppTheme.appColor.primary,
          ),
        ),
      ),
    );
  }
}