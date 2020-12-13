import 'package:flutter/material.dart';
import 'package:medic_app/models/consult/symptoms.dart';
import 'package:medic_app/providers/doctors_provider/doctorCategory.dart';
import 'package:medic_app/screen/catScreen/allcat.dart';
import 'package:medic_app/screen/doctor/doctorList/doctorList.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/home_screen/cahe_images/image_cache.dart';
import 'package:medic_app/widgets/home_screen/options.dart/scrollWidgets.dart';
import 'package:provider/provider.dart';

class Specialist extends StatelessWidget {
  const Specialist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Symptoms> sypData =
        Provider.of<SymptomsProvider>(context, listen: false)
            .getGeneralSpecialise();
    List<Widget> spclGenCrds = [];

    for (Symptoms sym in sypData) {
      spclGenCrds.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => DoctorScreen(),
                ),
              );
            },
            child: buildCSplCards(sym),
          ),
        ),
      );
    }
    spclGenCrds.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AllCateGoriesSymptom(),
                  ),
                );
              },
              child: buildCSplCards(Symptoms(
                category: "",
                imgurl: "https://kultuurikatel.ee/static/30-1.jpg",
                name: ""
              )),
            ),
          ),
        );
spclGenCrds.toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Doctors In Spcialisation",
              style: AppTheme.textTheme.headline4,
            ),
            SizedBox(
              height: 5,
            ),
scrollOptions(
  context,
  spclGenCrds,
  height: 150
)

            // GridView.builder(
            //   physics: BouncingScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: spclGenCrds.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       // crossAxisSpacing: 5,
            //       childAspectRatio: 1,
            //       mainAxisSpacing: 0),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: spclGenCrds[index]
            //     );
            //   },
            // ),
          ]),
    );
  }
}

ClipRRect buildCSplCards(
  Symptoms syp,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      height: 130,
      width: 125,
      child: GridTile(
        footer: Container(
          height:syp.name.trim().isEmpty?0: 50,
          decoration: BoxDecoration(color: Colors.black54),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${syp.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    AppTheme.textTheme.headline6.copyWith(color: Colors.white)),
          ),
        ),
        child: ImageCahed(
          image: "${syp.imgurl}",
        ),
      ),
    ),
  );
}
