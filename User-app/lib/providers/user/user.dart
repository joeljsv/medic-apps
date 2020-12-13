import 'package:flutter/cupertino.dart';
import 'package:medic_app/models/user/userModel.dart';

class UserPRovider with ChangeNotifier {
  User user;
  bool isPredict = false;
  final dummyDa = {
    "name": "Joel Sunny",
    "email": "joel@joel.com",
    "phn": "9400938641",
    "uid": "123456jj",
    "prourl":
        "https://www.webxcreation.com/event-recruitment/images/profile-1.jpg",
    "dob": "2000-11-01T14:59:00.538724",
    "weight": 65,
    "height": 165,
    "appointMents": ["hgb", "ghvguy"],
    "docuMents": [],
    "lapBrepots": ["hfv"],
    "lapAppointments": ["g", "fgd"],
    "onlinEConsultHistory": [],
    "fitData": '',
    "famMebers": [],
  };

  User get userGet => user;
  bool get predict => isPredict;
   changepred()async {
     isPredict = true;
  }

  //getName
  Future<User> getProfile(String phn) async {
    user = User(
      name: dummyDa["name"],
      email: dummyDa["email"],
      phn: dummyDa["phn"],
      prourl: dummyDa["prourl"],
      appointMents: dummyDa["appointMents"],
      dob: dummyDa["dob"],
      docuMents: dummyDa["docuMents"],
      fitData: dummyDa["fitData"],
      height: dummyDa["height"],
      lapAppointments: dummyDa["lapAppointments"],
      lapBrepots: dummyDa["lapBrepots"],
      onlinEConsultHistory: dummyDa["onlinEConsultHistory"],
      uid: dummyDa["uid"],
      weight: dummyDa["weight"],
      famMebers: dummyDa["famMebers"],
    );
    return user;
  }

  addDoc(String img) {
    user.docuMents.add(img);
  }
}
