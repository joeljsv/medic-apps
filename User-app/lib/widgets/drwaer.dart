import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/screen/lab_test/lab_test.dart';
import 'package:medic_app/theme/theme.dart';

Drawer widDraw(BuildContext context) {
  return Drawer(
    
    child: Column(
      // Important: Remove any padding from the ListView.
    
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.all(0),
          child: Container(
            color:AppTheme.appColor.primary.withAlpha(80),
            padding: EdgeInsets.all(0),
            child: Center(
              child: Text(
                'MEDIC',
                style: AppTheme.textTheme.headline2.copyWith(fontSize: 40,color: AppTheme.appColor.primary),
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( "assets/img/diag.jpg"))
          ),
        ),
       Padding(
         padding: const EdgeInsets.all(15),
         child: Text("Diagnose with reports",style: AppTheme.textTheme.headline2.copyWith(
           fontSize: 20
         )),
       ),
        button(context, "Cancer"),
        button(context, "Diabetes"),
        button(context, "Heart"),
        button(context, "Liver"),
        button(context, "Kidney"),
        Spacer(),
        ListTile(
          leading: Icon(Icons.logout),
          title:Text("Logout",style: AppTheme.textTheme.headline2.copyWith(
         fontSize: 20
         )),
        )
      ],
    ),
  );
}

ListTile button(
  BuildContext context,
  String title,
) {
  return ListTile(
    leading: Container(
      height: 30,
      child: Image.asset(
        "assets/img/${title.toLowerCase()}.png",
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      '$title Diagnose',
      style: AppTheme.textTheme.headline2.copyWith(fontSize: 20),
    ),
    onTap: () {
      // Update the state of the app
      // ...
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Diagonose(title),
        ),
      );
    },
  );
}
