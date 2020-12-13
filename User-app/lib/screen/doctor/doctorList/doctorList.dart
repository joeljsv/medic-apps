import 'package:flutter/material.dart';
import 'package:medic_app/models/doctor/doctor.dart';
import 'package:medic_app/providers/doctors_provider/doctorProvider.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/appbar.dart';
import 'package:medic_app/utils/essentials/futureWait.dart';
import 'package:medic_app/widgets/doctorScreen/doctorList/doctorslist.dart';
import 'package:provider/provider.dart';

class DoctorScreen extends StatefulWidget {
  final bool isdOff;
  const DoctorScreen({Key key, this.isdOff=false}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    getDoctors() async {
      final List<Doctor> doctors =
          await Provider.of<Doctorprovider>(context, listen: false)
              .getDoctors();
      return doctors;
    }

    return Scaffold(
      appBar: inAppBar("Choose Doctor"),
      body: FutureBuilder(
        future: getDoctors(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done&&snap.hasData)
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  filters(width),
                  DocrorListWid(snap.data,isdOff:widget.isdOff),
                ],
              ),
            );
            else
              return FutureHandleing(snap);
        },
      ),
    );
  }

// *******Filter Section
  Row filters(double width) {
    return Row(
      children: [
        FlatButton.icon(
          splashColor: Colors.transparent,
          onPressed: () {},
          icon: Icon(
            Icons.filter_alt_sharp,
            size: 18,
            color: AppTheme.appColor.primary,
          ),
          label: Text(
            "Filter",
            style: AppTheme.textTheme.subtitle2.copyWith(
              color: AppTheme.appColor.primary,
            ),
          ),
        ),
        //Filter lists***********************
        filterScroll(width),
      ],
    );
  }

  Padding filterlist() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: Chip(
        deleteIcon: Icon(
          Icons.cancel,
          size: 18,
          color: AppTheme.appColor.primaryVariant,
        ),
        onDeleted: () {},
        backgroundColor: AppTheme.appColor.secondary,
        label: Text(
          "Physician",
          style: AppTheme.textTheme.subtitle2.copyWith(
            color: AppTheme.appColor.primary,
          ),
        ),
      ),
    );
  }

  SizedBox filterScroll(double width) {
    return SizedBox(
      height: 50,
      width: width - 90,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (ctx, i) {
          return filterlist();
        },
      ),
    );
  }
}
