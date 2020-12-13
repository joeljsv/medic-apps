import 'package:flutter/widgets.dart';
import 'package:medic_app/models/consult/symptoms.dart';

class SymptomsProvider with ChangeNotifier {
  List<Symptoms> quickCat = [];
  List<Symptoms> specialisers = [];
  final spcl = [
    {
      "cat": "ent",
      "name": "Pediatrician",
      "imgUrl":
          "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/reference_guide/pediatrician_or_family_practitioner_ref_guide/650x350_pediatrician_or_family_practitioner_ref_guide.jpg?resize=650px:*",
    },
    {
      "cat": "ent",
      "name": "Ophthalmologist or Eye Specialist",
      "imgUrl":
          "https://images.medicinenet.com/images/article/main_image/perrla-eye-assessment-test.jpg",
    },
    {
      "cat": "ent",
      "name": "Cardiologist",
      "imgUrl":
          "https://www.hawaiipacifichealth.org/media/3922/what-is-a-cardiologist-web.jpg",
    },
    {
      "cat": "ent",
      "name": "Ear Nose & Throat",
      "imgUrl":
          "https://www.mymotheryourmother.com/wp-content/uploads/2020/01/shutterstock_628322585-1024x683.jpg",
    },
    {
      "cat": "ent",
      "name": "Gynecologist",
      "imgUrl":
          "https://www.landmarkhospitals.net/images/gynecology-treatment.jpg",
    },
  ];
final qyuic = [
    {
      "cat": "ent",
      "name": "Cold and Flu",
      "imgUrl":
          "https://bmtpartner.co.uk/wp-content/uploads/2015/11/icon_aftercare.png",
    }, {
      "cat": "ent",
      "name": "Cough",
      "imgUrl":
          "https://bmtpartner.co.uk/wp-content/uploads/2015/11/icon_aftercare.png",
    }, {
      "cat": "ent",
      "name": "Sore Throat",
      "imgUrl":
          "https://bmtpartner.co.uk/wp-content/uploads/2015/11/icon_aftercare.png",
    }, {
      "cat": "ent",
      "name": "Fever/Pain",
      "imgUrl":
          "https://bmtpartner.co.uk/wp-content/uploads/2015/11/icon_aftercare.png",
    }, {
      "cat": "ent",
      "name": "Stomach Aches",
      "imgUrl":
          "https://bmtpartner.co.uk/wp-content/uploads/2015/11/icon_aftercare.png",
    },
  ];
  getCommonSymptomsList() {
    quickCat.clear();

    for (var ele in qyuic) {
      quickCat.add(Symptoms(
          category: 'phys',
          imgurl:
             ele["imgUrl"] ,
          name:  ele["name"] ));
    }
    return quickCat.toList();
  }

  getGeneralSpecialise() {
    specialisers.clear();
    for (var sp in spcl) {
      specialisers.add(Symptoms(
          category: "${sp["cat"]}",
          imgurl: "${sp["imgUrl"]}",
          name: "${sp["name"]}"));
    }
    return specialisers.toList();
  }
}
