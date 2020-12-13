import 'package:flutter/material.dart';
import 'package:medic_app/models/doctor/doctor_detail.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/home_screen/cahe_images/image_cache.dart';

import 'aboutDoc.dart';

class DoctorWidgetView extends StatelessWidget {
  final DoctorDetail doctor;
  final bool isOff;
  const DoctorWidgetView({
    Key key,
    this.doctor, this.isOff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Image And name
          imggName(width),
          AboutDoc(
            doctor: doctor,
            isOff:isOff
          )
        ],
      ),
    );
  }

  //  Image And name
  Row imggName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 140,
            width: 100,
            child: ImageCahed(
              image: doctor.proUrl,
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: width - 145,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Dr. ${doctor.name}",
                  style: AppTheme.textTheme.headline1,
                  overflow: TextOverflow.visible,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.appColor.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${doctor.specialist}\n",
                              style: AppTheme.textTheme.headline5),
                          TextSpan(
                            text: "${doctor.education}",
                            style: AppTheme.textTheme.subtitle2.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
