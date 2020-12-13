import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medic_admin/screen/chat/chat.dart';

Color primaryColor = Color(0xff0074ff);

class AccountCard extends StatelessWidget {
  final bool active;
  final String name;
  final String id;
  final String hour;

  const AccountCard(
      {Key key, this.active = false, this.name, this.hour, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: active ? primaryColor : Colors.white,
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: Icon(FontAwesomeIcons.user,color: Colors.white),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   // image: NetworkImage(
                //   //     "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg"),
                // ),
              ),
            ),
            Container(
              width: 150,
              child: ListTile(
                onTap: (){
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen("Joel Sunny"),
      ),
    );
                },
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(id),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  hour,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.check_circle,
                  size: 30,
                  color: Color(0xff26e56d),
                ),
                Icon(
                  Icons.cancel,
                  size: 30,
                  color: Color(0xffff4077),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
