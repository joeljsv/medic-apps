import 'package:flutter/material.dart';
import 'package:medic_app/models/doctor/doctor_detail.dart';
import 'package:medic_app/providers/auth/auth.dart';
import 'package:medic_app/providers/doctors_provider/doctorProvider.dart';
import 'package:medic_app/screen/payment/pay.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/appbar.dart';
import 'package:medic_app/utils/essentials/dilog.dart';
import 'package:medic_app/utils/essentials/futureWait.dart';
import 'package:medic_app/widgets/doctorScreen/chat/chat.dart';
import 'package:medic_app/widgets/doctorScreen/doctor%20detail/docDetail_widget.dart';
import 'package:provider/provider.dart';
import '../../../models/call_api.dart';

class DoctorDetailScreen extends StatelessWidget {
  static const routName = "/doctorDetail";
  final String ids;
  final bool isOff;
  const DoctorDetailScreen({Key key, this.ids, this.isOff = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ids ?? ModalRoute.of(context).settings.arguments as String;
    DoctorDetail doc;
    Call_API api;
    Future<DoctorDetail> getDoctor() async {
      try {
        final prov = Provider.of<Doctorprovider>(context, listen: false);
        doc = await prov.getDoctor(id);
        api = prov.api;
        return doc;
      } catch (e) {
        throw e;
      }
    }

    return Scaffold(
      
      appBar: inAppBar("", medic: true),
      body: FutureBuilder(
        future: getDoctor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData)
           {
             
              return SingleChildScrollView(
              child: DoctorWidgetView(
                doctor: snapshot.data,
                isOff: isOff,
              ),
            );}
          else
            return FutureHandleing(snapshot);
        },
      ),
      floatingActionButton: FlatButton(
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () async {
          // if (isOff) {
          //   loadingDilog(context);
          //   try {
          //     await Provider.of<AuthProvder>(context, listen: false).confirm();
          //     Navigator.pop(context);
          //   } catch (e) {
          //     Navigator.pop(context);
          //   }
          // }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) =>Payment(
                    isOff: isOff,
                    name: doc.name,
                    payAmount: doc.offerPrice.toString(),
                    api:api
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Consult Now",
            style: AppTheme.textTheme.headline5.copyWith(color: Colors.white),
          ),
        ),
        color: AppTheme.appColor.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // FloatingActionButton(
      //   isExtended: true,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text("Consult Now"),
      //   ),
      //   onPressed: () {},
      //   backgroundColor: AppTheme.appColor.primary,
      // ),
    );
  }
}
