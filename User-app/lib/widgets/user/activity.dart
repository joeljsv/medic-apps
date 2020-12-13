import 'package:flutter/material.dart';
import 'package:medic_app/screen/profile/habbit.dart';
import 'package:medic_app/screen/profile/profile.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/history/history.dart';
import 'package:medic_app/widgets/user/document.dart';

class UserActiity extends StatelessWidget {
  const UserActiity({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        options(
          "Consult History",context,
          History(
            type: "Consult",
          ),
        ),
        options(
          "Lab History",
          context,
       History(
            type: "Lab",
          ),
        ),
        options(
          "Orders",
          context,
          History(
            type: "Orders",
          ),
        ),
        options(
          "Documents",
          context,
          Document(),
        ),
        options(
          "Life Style",
          context,
          Habbits(),
        ),
        options(
          "Profile Settings",
          context,
          Profile(),
        ),
      ],
    );
  }

  Widget options(String title, BuildContext context, Widget wid) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => wid));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.appColor.secondary),
          child: Row(
            children: [
              Text(title, style: AppTheme.textTheme.headline5),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
