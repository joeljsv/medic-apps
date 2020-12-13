import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:medic_app/theme/theme.dart';

SizedBox scrollOptions(BuildContext context, List widget,{double height=70}) {
  return SizedBox(
    height: height,
    child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: widget),
  );
}

Widget bittons(
  BuildContext ctx, {
  String title,
  IconData icon,
  String imageUrl,
  Widget pageRout,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.of(ctx).push(
          MaterialPageRoute(builder: (ctx) => pageRout),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl != null)
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              backgroundImage: ExtendedNetworkImageProvider(
                imageUrl,
                cache: true,
              ),
            ),
          if (imageUrl == null)
            CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent[800],
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                )),
          Text(
            title,
            style: AppTheme.textTheme.subtitle2.copyWith(
                color: (imageUrl != null) ? Colors.black : Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 14),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
