import 'package:flutter/widgets.dart';
import 'package:medic_app/models/doctor/doctor.dart';
import 'dart:convert';
import 'package:medic_app/models/doctor/doctor_detail.dart';
import 'package:http/http.dart' as http;
import '../../utils/apis/server.dart';
import '../../models/call_api.dart';

class Doctorprovider with ChangeNotifier {
  List<Doctor> doctors = [];
  Call_API api_call=Call_API();
// ***Dummy Data
  final doctor = [
    {
      "name": "Narayana Murthi",
      "specialist": "Radiolagist",
      "hospital": "Apollo Bangalore",
      "experience": "2 Years",
      "proUrl":
          "https://www.clinicarementeria.es/wp-content/uploads/2018/04/doctor-juan-gros.jpg",
      "hosUrl":
          "https://p.kindpng.com/picc/s/157-1578582_transparent-hospital-png-transparent-apollo-hospitals-logo-png.png",
      "review": 4.1,
      "education": "MBBS, DNB (Radiology), Diploma in Radiology",
      "languages": "English, മലയാളം, தமிழ்",
      "price": 499,
      "offerPrice": 299,
      "noOfCinsultaion": "2",
      "avilable": true,
      "waitingTime": 25,
      "id": "doc1",
      "accademics": [
        "MBBS@-Andhra Medical College, Visakhapatnam, 1998",
        "DNB (General Medicine)@-Texas Tech University Health Science. USA, 2007"
      ],
      "hospAddres":
          "54, IIM, 11, Bannerghatta Main Rd, opposite Krishnaraju Layout, Krishnaraju Layout, Amalodbhavi Nagar, Naga, Bengaluru, Karnataka 560076",
      "description":
          "Dr. Tessa Jhon Venati practices at Fortis Hospital in Bannerghatta Road",
      "hosDescription":
          "Apollo Hospitals Enterprise Limited is an Indian hospital "
    },
    {
      "name": "Tessa Jhon",
      "specialist": "Physican",
      "hospital": "Aster Medicity",
      "experience": "5 Years",
      "proUrl":
          "https://assets.mfine.co/api/contentservice/attachments/downloadFromDb?fileName=Dr.-Sarada.jpg",
      "hosUrl":
          "https://lh3.googleusercontent.com/proxy/dGk3gsIySuP8HFzDwd5_cg3l5dcaKMdsov25QTnJ889XJrylu_5LNxIr2Ht5QcI4Eq5uvqE306zfopUEPRheqP44Gv1N2t-KKj-0Tl215LBwzevF4A-lsfq0VYD9",
      "review": 4.4,
      "education": "MBBS, DNB (Family Medicine), MRCGP (INT)",
      "languages": "English, മലയാളം, हिंदी, ಕನ್ನಡ",
      "price": 499,
      "offerPrice": 299,
      "noOfCinsultaion": "2",
      "avilable": true,
      "waitingTime": 10,
      "id": "doc2",
      "accademics": [
        "MBBS@-Andhra Medical College, Visakhapatnam, 1998",
        "DNB (General Medicine)@-Texas Tech University Health Science. USA, 2007"
      ],
      "hospAddres":
          "54, IIM, 11, Bannerghatta Main Rd, opposite Krishnaraju Layout, Krishnaraju Layout, Amalodbhavi Nagar, Naga, Bengaluru, Karnataka 560076",
      "description":
          "Dr. Tessa Jhon Venati practices at Fortis Hospital in Bannerghatta Road,",
      "hosDescription":
          "Apollo Hospitals Enterprise Limited is an Indian hospital chain based in Chennai, India."
    },
  ];

  Future<List<Doctor>> getDoctors() async {
     final ff=await http.get("https://webscraper.io/test-sites");
    doctors.clear();
    doctor.forEach((data) {
      doctors.add(
        Doctor(
          avilable: data['avilable'],
          experience: data['experience'],
          hospital: data['hospital'],
          languages: data['languages'],
          name: data['name'],
          offerPrice: data['offerPrice'],
          price: data['price'],
          proUrl: data['proUrl'],
          specialist: data['specialist'],
          id: data['id'],
        ),
      );
    });
    return doctors.toList();
  }
Call_API get api=>api_call;
// ****Find Doctor with ID
  Future<DoctorDetail> getDoctor(String id) async {
    try {
      final tok=await http.get(SERVER_URL+"/user/token");
      if(tok.statusCode==200){
       final api= Call_API.fromJson(jsonDecode(tok.body));
       api_call=api;
      }
      final data = doctor.firstWhere((doctorS) => doctorS["id"] == id);
      final DoctorDetail doct = DoctorDetail(
        avilable: data['avilable'],
        education: data['education'],
        experience: data['experience'],
        hosUrl: data['hosUrl'],
        hospital: data['hospital'],
        languages: data['languages'],
        name: data['name'],
        noOfCinsultaion: data['noOfCinsultaion'],
        offerPrice: data['offerPrice'],
        price: data['price'],
        proUrl: data['proUrl'],
        review: data['review'],
        specialist: data['specialist'],
        waitingTime: data['waitingTime'],
        id: data['id'],
        accademics: data['accademics'],
        description: data['description'],
        hosDescription: data['hosDescription'],
        hospAddres: data['hospAddres'],
      );
      return doct;
    } catch (e) {
      throw e;
    }
    // return doctors.firstWhere();
  }
}
