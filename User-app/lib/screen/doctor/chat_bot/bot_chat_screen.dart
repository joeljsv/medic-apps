import 'package:flutter/material.dart';
import 'package:medic_app/providers/doctors_provider/messages_provider.dart';
import 'package:medic_app/widgets/doctorScreen/chat/messages_item.dart';
import 'package:provider/provider.dart';

import 'chatBot_suggestion.dart';

class ChatScreenBit extends StatelessWidget {
  const ChatScreenBit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height-50,
      child: SingleChildScrollView(
         reverse: true,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Consumer<MessagesProvider>(
              builder: (_, messagesProvider, __) => Container(
                child: ListView.builder(
                  
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: messagesProvider.botMessages.length,
                  itemBuilder: (ctx, i) => MessagesItem(
                      messagesProvider.botMessages[i],
                      !messagesProvider.botMessages[i].isUserMessage("MEDIC"),
                      "MEDIC"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChatBotSuggestion(),
            )
          ],
        ),
      ),
    );
  }
}
