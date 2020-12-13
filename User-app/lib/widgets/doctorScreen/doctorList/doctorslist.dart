import 'package:flutter/material.dart';
import 'package:medic_app/models/doctor/doctor.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/doctorScreen/doctorList/doctorTile.dart';
import '../../../screen/doctor/doctorDetail/detailDoctor.dart';

class DocrorListWid extends StatelessWidget {
  final List<Doctor> doctors;
  final bool isdOff;
  const DocrorListWid(this.doctors, {Key key, this.isdOff = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return doctortiles();
  }

  ListView doctortiles() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: doctors.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (isdOff)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => DoctorDetailScreen(
                              ids: doctors[i].id,
                              isOff: isdOff,
                            )));
              else
                Navigator.of(context).pushNamed(DoctorDetailScreen.routName,
                    arguments: doctors[i].id);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Card(
                shadowColor: AppTheme.appColor.secondary,
                elevation: 2,
                child: DoctorTileView(
                  doctor: doctors[i],
                  isdOff: isdOff,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
