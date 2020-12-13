import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/models/doctor/doctor_detail.dart';
import 'package:medic_app/screen/profile/habbit.dart';
import 'package:medic_app/theme/theme.dart';

class AboutDoc extends StatelessWidget {
  final DoctorDetail doctor;
  final isOff;
  const AboutDoc({Key key, @required this.doctor, this.isOff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          quickDetail(),
          if(!isOff)
          SizedBox(
            height: 10,
          ),
          if(isOff)
          LisfeStyleForm(
            isPop: false,
            title: "Avialble Times",
            optins: [
              "8.00 AM - 10.00 AM Today",
              "2.00 PM - 6.00 PM Today",
              "8.00 AM - 10.00 AM Tommorow",
            ],
          ),
          titlesCrved("About Me", LineAwesomeIcons.user_tie),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${doctor.description}",
              style: AppTheme.textTheme.headline6,
            ),
          ),
          titlesCrved("Education", LineAwesomeIcons.user_tie),
          ListView.builder(
              itemCount: doctor.accademics.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppTheme.appColor.secondary,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        LineAwesomeIcons.graduation_cap,
                        size: 35,
                        color: AppTheme.appColor.primary,
                      ),
                    ),
                    title: Text(
                      "${doctor.accademics[i].split("@-")[0]}",
                      style: AppTheme.textTheme.headline5,
                    ),
                    subtitle: Text(
                      "${doctor.accademics[i].split("@-")[1]}",
                      style: AppTheme.textTheme.headline6,
                    ),
                  ),
                );
              }),
          titlesCrved("Hospital", LineAwesomeIcons.hospital),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${doctor.hosDescription}",
              style: AppTheme.textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${doctor.hospAddres}",
              style: AppTheme.textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }

  Container quickDetail() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.appColor.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Card(
        color: AppTheme.appColor.secondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  icoNimage(
                      LineAwesomeIcons.certificate,
                      Text(
                        " Experience: ${doctor.experience}",
                        style: AppTheme.textTheme.headline5,
                      ),
                      siz: 30),
                  Spacer(),
                  Text(
                    "${doctor.offerPrice ?? doctor.price}₹",
                    style: AppTheme.textTheme.headline4,
                  )
                ],
              ),
              icoNimage(
                LineAwesomeIcons.bullhorn,
                Expanded(
                  child: Text(
                    " Spaek: ${doctor.languages}",
                    maxLines: 2,
                    style: AppTheme.textTheme.headline5,
                  ),
                ),
              ),
              icoNimage(
                LineAwesomeIcons.hospital,
                Expanded(
                  child: Text(
                    " Work at: ${doctor.hospital}",
                    style: AppTheme.textTheme.headline5,
                  ),
                ),
              ),
              // Center(
              //   child: Text(
              //     "${doctor.hospAddres}",
              //     textAlign: TextAlign.center,
              //     style: AppTheme.textTheme.headline6
              //         .copyWith(color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Row icoNimage(IconData ic, Widget text, {double siz = 25}) {
    return Row(
      children: [
        Icon(
          ic,
          size: siz,
          color: Colors.black,
        ),
        text
      ],
    );
  }

  Container titlesCrved(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.appColor.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Icon(
            icon,
            size: 25,
          ),
          Text(" $title", style: AppTheme.textTheme.headline4),
          Spacer(),
        ],
      ),
    );
  }
}
