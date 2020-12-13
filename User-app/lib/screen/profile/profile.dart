import 'package:flutter/material.dart';
import 'package:medic_app/models/user/userModel.dart';
import 'package:medic_app/providers/user/user.dart';
import 'package:medic_app/screen/auth/login.dart';
import 'package:medic_app/screen/profile/fam.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/futureWait.dart';
import 'package:medic_app/widgets/user/activity.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> getusre() async {
      try {
        final User user =
            await Provider.of<UserPRovider>(context, listen: false)
                .getProfile("7034445301");
        return user;
      } catch (e) {
        print(e);
        throw e;
      }
    }

    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: FutureBuilder(
          future: getusre(),
          builder: (ctx, snap) {
            if (snap.hasData) {
              final User user = snap.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      userSummaryCard(context, height, user),
                      SizedBox(
                        height: 10,
                      ),
                      Text("My Activiy", style: AppTheme.textTheme.headline4),
                      SizedBox(
                        height: 10,
                      ),
                      UserActiity()
                    ],
                  ),
                ),
              );
            } else {
              return FutureHandleing(snap);
            }
          }),
    );
  }

  Container userSummaryCard(BuildContext context, double height, User user) {
    return Container(
      height: height / 3.3,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.indigo[100], borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.group),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => FamList()));
                  }),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.group_add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => LoginPage('Add Your\nFamily Member')));
                  })
            ],
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.prourl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${user.name}", style: AppTheme.textTheme.headline5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userSummary("Documents", user.docuMents),
              userSummary("Appointments", user.appointMents),
              userSummary("Lab test", user.lapAppointments),
              userSummary("Reports ", user.lapBrepots),
            ],
          )
        ],
      ),
    );
  }

  Widget userSummary(String title, List user) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: AppTheme.textTheme.subtitle1.copyWith(
                color: AppTheme.appColor.primary,
              ),
            ),
            TextSpan(
              text: "\n${user.length}",
              style: AppTheme.textTheme.headline4.copyWith(
                color: AppTheme.appColor.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
