import 'package:flutter/material.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/appbar.dart';

class FamList extends StatelessWidget {
  const FamList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: inAppBar("Family members"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.indigo[100], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE9tG_NFfmLde3aA3q3p2yib1KJslRRNlJQg&usqp=CAU"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Akshay A", style: AppTheme.textTheme.headline5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  userSummary("Documents", "2"),
                  userSummary("Appointments", "2"),
                  userSummary("Lab test", "3"),
                  userSummary("Reports ", "0"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget userSummary(String title, String user) {
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
