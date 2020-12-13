import 'package:flutter/material.dart';
import 'package:medic_app/models/consult/symptoms.dart';
import 'package:medic_app/providers/doctors_provider/doctorCategory.dart';
import 'package:medic_app/screen/doctor/doctorList/doctorList.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:provider/provider.dart';

import 'scrollWidgets.dart';

class QuickConsult extends StatelessWidget {
  const QuickConsult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Geting All Common Symptoms
    final List<Symptoms> catList =
        Provider.of<SymptomsProvider>(context,listen: false).getCommonSymptomsList();
    List<Widget> widList = [];
// populate to widgets
    catList.forEach(
      (symptom) {
        widList.add(
          bittons(
            context,
            imageUrl: symptom.imgurl,
            title: symptom.name,
            pageRout: DoctorScreen(),
          ),
        );
      },
    );
    widList=widList.toList();
  //  final int le=int.parse((widList.length/2).toString()) ;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("General Consultations",style: AppTheme.textTheme.headline4,),
        ),
        scrollOptions(
          context,
          widList,
        ),
        //  scrollOptions(
        //   context,
        //   widList.sublist(5,10),
        // ),
      ],
    );
  }
}
