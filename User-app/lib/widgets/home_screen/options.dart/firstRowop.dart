
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/screen/doctor/doctorList/doctorList.dart';
import 'package:medic_app/screen/hospital/hospitals.dart';
import 'package:medic_app/screen/labs/lab.dart';
import 'package:medic_app/screen/medicine/medicalStore.dart';
import 'package:medic_app/theme/theme.dart';

import 'scrollWidgets.dart';


class FirstOpt extends StatelessWidget {
  FirstOpt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widList = <Widget>[
      bittons(
        context,
        icon: LineAwesomeIcons.stethoscope,
        title: "Consult Doctor",
        pageRout: DoctorScreen(),
      ),
      bittons(
        context,
        icon: LineAwesomeIcons.hospital,
        title: "Book O P",
        pageRout: DoctorScreen(
          isdOff: true,
        ),
      ),
      bittons(
        context,
        icon: LineAwesomeIcons.vials,
        title: "Book Lab Test",
        pageRout: LabScreen(),
      ),
      bittons(
        context,
        icon: LineAwesomeIcons.capsules,
        title: "Order Medicine",
        pageRout: MedicalStore(),
      ),
      bittons(
        context,
        icon: LineAwesomeIcons.doctor,
        title: "Near By Hospital",
        pageRout: HospitalsScreen(),
      ),
    ];
    return Container(
      color: AppTheme.appColor.primary,
      child: scrollOptions(
        context,
        widList,
      ),
    );
  }
}

