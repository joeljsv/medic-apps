import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/models/doctor/doctor.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/home_screen/cahe_images/image_cache.dart';

class _DoctorDetail extends StatelessWidget {
  final bool isdOff;
  _DoctorDetail({
    Key key,
    this.doctor, this.isdOff,
  }) : super(key: key);

  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dr. ${doctor.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '${doctor.specialist}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.textTheme.headline5.copyWith(
                  color: AppTheme.appColor.primaryVariant,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        LineAwesomeIcons.language,
                        size: 15,
                      ),
                    ),
                    TextSpan(
                      style: AppTheme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      text: ' ${isdOff?"5 Km away":doctor.languages}',
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '${doctor.hospital}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.textTheme.subtitle1.copyWith(),
              ),

              // const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              // Row(
              //   children: [
              //     roundedContainer('Experience',
              //         botomR: 0,
              //         topR: 0,
              //         col: AppTheme.appColor.primary,
              //         texCol: Colors.white),
              //     roundedContainer(' ${doctor.experience}', botomL: 0, topL: 0),
              //     Spacer(),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 3),
              //       child: roundedContainer(
              //           "${doctor.avilable ? "" : "Not"}Avilable"),
              //     )
              //   ],
              // )
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            children: [
              roundedContainer('Experience',
                  botomR: 0,
                  topR: 0,
                  col: AppTheme.appColor.primary,
                  texCol: Colors.white),
              roundedContainer(' ${doctor.experience}', botomL: 0, topL: 0),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    if (doctor.offerPrice != null && doctor.offerPrice != 0)
                      TextSpan(
                        text: ' ${doctor.price}₹ ',
                        style: AppTheme.textTheme.headline6.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppTheme.appColor.primary),
                      ),
                    TextSpan(
                      text:
                          ' ${(doctor.offerPrice != null && doctor.offerPrice != 0) ? doctor.offerPrice : doctor.price} ₹',
                      style: AppTheme.textTheme.headline5
                          .copyWith(color: AppTheme.appColor.primary),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ],
    );
  }Container roundedContainer(
  String title, {
  double topR = 5,
  double topL = 5,
  double botomR = 5,
  double botomL = 5,
  Color col = Colors.white,
  Color texCol = Colors.black,
  double width,
}) {
  return Container(
      padding: EdgeInsets.all(2.5),
     decoration: BoxDecoration(
       color:col ,
       border: Border.all(
         color: AppTheme.appColor.primary
       ),
       borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(botomL),
          bottomRight: Radius.circular(botomR),
          topLeft: Radius.circular(topL),
          topRight: Radius.circular(topR),
       )
     ),
      child: Text(
        '$title',
        style: AppTheme.textTheme.subtitle2.copyWith(
          color: texCol,
        ),
      ));
}
}



class DoctorTileView extends StatelessWidget {
  final bool isdOff;
  DoctorTileView({
    Key key,
    this.doctor, this.isdOff,
  }) : super(key: key);

  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: ImageCahed(
                      image: doctor.proUrl,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                    child: _DoctorDetail(
                      doctor: doctor,
                      isdOff:isdOff,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
