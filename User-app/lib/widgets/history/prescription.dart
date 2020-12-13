import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/home_screen/cahe_images/image_cache.dart';

class Prescription extends StatelessWidget {
  final form;
  const Prescription({Key key, this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          form == "Lab" ? "Lab report" : "Prescription",
          style: AppTheme.textTheme.headline2.copyWith(color: Colors.white),
        ),
      ),
      body: ImageCahed(
        cah: false,
        image: form == "Lab"
            ? "https://reporting.onedrop.today/wp-content/uploads/2018/02/dtsStudyResults-2.png"
            : "https://miro.medium.com/max/2478/1*vmrECBK2adlFhE6IXA8rzg.jpeg",
      ),
    );
  }
}
