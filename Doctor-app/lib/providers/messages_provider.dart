import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:medic_admin/models/call_api.dart';
import 'package:medic_admin/utils/api.dart';
import 'package:http/http.dart' as http;

import '../models/message.dart';

class MessagesProvider with ChangeNotifier {
  final List<Message> _messages = [];
  Call_API api_call = Call_API();
  List<Message> get allMessages => [..._messages];

  void addMessage(Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }
 Call_API get api=>api_call;
  Future<void> getToken() async {
    try {
      final tok = await http.get(SERVER_URL + "/user/token");
      if (tok.statusCode == 200) {
        final api = Call_API.fromJson(jsonDecode(tok.body));
        api_call = api;
      } else
        throw "no api";
    } catch (e) {
      throw e;
    }
  }
}
