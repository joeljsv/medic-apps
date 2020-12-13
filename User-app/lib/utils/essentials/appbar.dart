import 'package:flutter/material.dart';
import 'package:medic_app/theme/theme.dart';

AppBar inAppBar(String title,{bool medic=false}) {
  return AppBar(
    actionsIconTheme: IconThemeData(
      color: AppTheme.appColor.primary,
    ),
    iconTheme: IconThemeData(
      color: AppTheme.appColor.primary,
    ),
    centerTitle: medic,
    backgroundColor: Colors.white,
    title:medic?Text("MEDIC",style:AppTheme.textTheme.headline2.copyWith(
        color: AppTheme.appColor.primary,
    )): Text(
      "$title",
      style: TextStyle(
        color: AppTheme.appColor.primary,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}
