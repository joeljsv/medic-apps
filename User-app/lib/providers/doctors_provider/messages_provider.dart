import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:medic_app/models/doctor/message.dart';
import 'package:http/http.dart' as http;
import 'package:medic_app/utils/apis/server.dart';

class MessagesProvider with ChangeNotifier {
  final List<Message> _messages = [];
  final List<Message> _botMessages = [];

  final symptoms = [
    "itching",
    "skin_rash",
    "nodal_skin_eruptions",
    "continuous_sneezing",
    "shivering",
    "chills",
    "joint_pain",
    "stomach_pain",
    "acidity",
    "ulcers_on_tongue",
    "muscle_wasting",
    "vomiting",
    "burning_micturition",
    "spotting_ urination",
    "fatigue",
    "weight_gain",
    "anxiety",
    "cold_hands_and_feets",
    "mood_swings",
    "weight_loss",
    "restlessness",
    "lethargy",
    "patches_in_throat",
    "irregular_sugar_level",
    "cough",
    "high_fever",
    "sunken_eyes",
    "breathlessness",
    "sweating",
    "dehydration",
    "indigestion",
    "headache",
    "yellowish_skin",
    "dark_urine",
    "nausea",
    "loss_of_appetite",
    "pain_behind_the_eyes",
    "back_pain",
    "constipation",
    "abdominal_pain",
    "diarrhoea",
    "mild_fever",
    "yellow_urine",
    "yellowing_of_eyes",
    "acute_liver_failure",
    "fluid_overload",
    "swelling_of_stomach",
    "swelled_lymph_nodes",
    "malaise",
    "blurred_and_distorted_vision",
    "phlegm",
    "throat_irritation",
    "redness_of_eyes",
    "sinus_pressure",
    "runny_nose",
    "congestion",
    "chest_pain",
    "weakness_in_limbs",
    "fast_heart_rate",
    "pain_during_bowel_movements",
    "pain_in_anal_region",
    "bloody_stool",
    "irritation_in_anus",
    "neck_pain",
    "dizziness",
    "cramps",
    "bruising",
    "obesity",
    "swollen_legs",
    "swollen_blood_vessels",
    "puffy_face_and_eyes",
    "enlarged_thyroid",
    "brittle_nails",
    "swollen_extremeties",
    "excessive_hunger",
    "extra_marital_contacts",
    "drying_and_tingling_lips",
    "slurred_speech",
    "knee_pain",
    "hip_joint_pain",
    "muscle_weakness",
    "stiff_neck",
    "swelling_joints",
    "movement_stiffness",
    "spinning_movements",
    "loss_of_balance",
    "unsteadiness",
    "weakness_of_one_body_side",
    "loss_of_smell",
    "bladder_discomfort",
    "foul_smell_of urine",
    "continuous_feel_of_urine",
    "passage_of_gases",
    "internal_itching",
    "toxic_look_(typhos)",
    "depression",
    "irritability",
    "muscle_pain",
    "altered_sensorium",
    "red_spots_over_body",
    "belly_pain",
    "abnormal_menstruation",
    "dischromic _patches",
    "watering_from_eyes",
    "increased_appetite",
    "polyuria",
    "family_history",
    "mucoid_sputum",
    "rusty_sputum",
    "lack_of_concentration",
    "visual_disturbances",
    "receiving_blood_transfusion",
    "receiving_unsterile_injections",
    "coma",
    "stomach_bleeding",
    "distention_of_abdomen",
    "history_of_alcohol_consumption",
    "fluid_overload",
    "blood_in_sputum",
    "prominent_veins_on_calf",
    "palpitations",
    "painful_walking",
    "pus_filled_pimples",
    "blackheads",
    "scurring",
    "skin_peeling",
    "silver_like_dusting",
    "small_dents_in_nails",
    "inflammatory_nails",
    "blister",
    "red_sore_around_nose",
    "yellow_crust_ooze",
    "prognosis"
  ];
  final List<String> _reply = [
    "Hi Joel\nI'm Medic 😊,\nHow can I help you today? 😃",
    "Okay,\nWhat're your symptoms?",
    "One More please",
    "This may be a chance of @@Dis You can consult doctors below",
    "You are always welcome🤗",
  ];
  List sugg = [
    ["Find a Doctor", "I've Some Symptoms😥"],
    ["", ""],
    ["", ""],
    ["Okat Thankyou😃"]
  ];
  List<Message> get allMessages => [..._messages];
  List<Message> get botMessages => [..._botMessages];

  void addMessage(Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }

  void addBotMessage(Message message) {
    _botMessages.insert(0, message);
    notifyListeners();
  }

  // *****Chat bot Funs
  Future<String> connectChatBot({String symptoms, int reply = 0}) async {
    try {
      print(symptoms);
      if (symptoms == null ) {  
        final repo = await http.get(CHATBOT_URL + "first");
        if (jsonDecode(repo.body)["data"] == "Ok") {
          return _reply[reply];
        } else
          throw "An error Occured";
      } else {
        final repo = await http.get(CHATBOT_URL + "?symptoms=$symptoms");
        final dis = jsonDecode(repo.body)["data"];
        if (dis != null) {
          return _reply[3].replaceAll("@@Dis", dis);
        } else
          throw "An error Occured";
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  List<String> getSymptoms({int sR}) {
    if (sR != 1&&sR!=2)
      return sugg[sR];
    else {
      var randomItem = (symptoms.toList()..shuffle()).sublist(0, 4);
      return randomItem.toList();
    }
  }
}
