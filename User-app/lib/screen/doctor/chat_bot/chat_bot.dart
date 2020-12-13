import 'package:flutter/material.dart';
import 'package:medic_app/models/doctor/message.dart';
import 'package:medic_app/providers/doctors_provider/messages_provider.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/loading.dart';
import 'package:provider/provider.dart';

import 'bot_chat_screen.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getBot() async {
      try {
        final proV = Provider.of<MessagesProvider>(context, listen: false);
        final String ms = await proV.connectChatBot();
        proV.addBotMessage(Message("MEDIC", ms, DateTime.now()));
        return ms;
      } catch (e) {
        print(e);
        throw e;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("MEDIC ASSISTANT",style:AppTheme.textTheme.caption),
      ),
      body: FutureBuilder(
        future: getBot(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return ChatWaiting("Waiting for MEDIC...");
          } else if (snap.hasData) {
            return ChatScreenBit();
          } else {
            return Center(
              child: Text(
                "An Error Occured",
                style: AppTheme.textTheme.caption,
              ),
            );
          }
        },
      ),
    );
  }
}
