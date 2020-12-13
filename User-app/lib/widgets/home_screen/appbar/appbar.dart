import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medic_app/models/location_model.dart';
import 'package:medic_app/providers/location.dart';
import 'package:medic_app/theme/theme.dart';
class Apploc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Future<Location_mod> getLocation() async {
    try {
      final Location_mod loc =
          await Provider.of<LocationProvider>(context).getLocation();
      final ret=loc;
      return ret;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  return FutureBuilder(
      future: getLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: 20, width: 20, child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return location(Icons.error," An error Occured");
        } else if (snapshot.hasData) {
          final loc=snapshot.data;
          return location(Icons.location_on,' ${loc.name}\n ${loc.address.split(",")[1]??''}');
        }else{
          return
          location(Icons.refresh," can\`t get Location");
        }
      });
  }
}



Container location(IconData icn,String text) {
  
  return Container(
    child: Row(
      children: [Icon(icn,),
      Text('$text',style: AppTheme.textTheme.subtitle2,)
      ],
    ),
  );
}
