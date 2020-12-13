import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic_app/models/doctor/message.dart';
import 'package:medic_app/providers/doctors_provider/messages_provider.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/loading.dart';
import 'package:provider/provider.dart';

class ChatBotSuggestion extends StatefulWidget {
  const ChatBotSuggestion({Key key}) : super(key: key);

  @override
  _ChatBotSuggestionState createState() => _ChatBotSuggestionState();
}

int ind = 0;
List<String> replay = [];
String ans = "";
String msg = "";
String dis;
final Color _clor = AppTheme.appColor.primary;
// bool _isWaiting = false;

class _ChatBotSuggestionState extends State<ChatBotSuggestion> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MessagesProvider>(context, listen: false);
    getBot() async {
      //  final ans = await prov.connectChatBot(reply: ind);
      // setState(() => _isWaiting = true);

      if (ind == 0) {
        replay = prov.getSymptoms(sR: ind);
      } else {
        replay = prov.getSymptoms(sR: ind);
        prov.addBotMessage(
          Message(
            "Medic",
            msg,
            DateTime.now(),
          ),
        );
        if (ind == 3) {
          ans = await prov.connectChatBot(
            reply: ind,
            symptoms: dis,
          );
        } else {
          ans = await prov.connectChatBot(reply: ind);
        }

        prov.addBotMessage(
          Message(
            "MEDIC",
            ans,
            DateTime.now(),
          ),
        );
      }

      print(ind);
      // setState(() => _isWaiting = false);
    }

    return FutureBuilder(
        future: getBot(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: TypingLoading(),
            );
          }
          return Wrap(
            children: replay
                .map((f) => GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        margin: EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: _clor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //                 <--- border radius here
                              ),
                        ),
                        child: InkWell(
                          onTap: () {
                            ind = ind + 1;

                            if (ind == 2) {
                              dis = f;
                            }
                            if (ind == 3) {
                              dis = dis + ",$f";
                            }
                            setState(
                              () => msg = f.replaceAll("_", " "),
                            );
                            // setState(() {});
                          },
                          child: Text(
                            f.replaceAll("_", " "),
                            style: AppTheme.textTheme.caption
                                .copyWith(color: _clor),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ))
                .toList(),
          );
//           GridView.builder(
//             shrinkWrap: true,
//   itemCount: replay.length,

//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisSpacing: 10,

//   childAspectRatio: MediaQuery.of(context).size.width /
//                   (MediaQuery.of(context).size.height / 4),
//       crossAxisCount: 2,),
//   itemBuilder: (BuildContext context, int index) {
//     return new Container(

//        decoration: BoxDecoration(

//         border: Border.all(
//           color: AppTheme.appColor.primary,
//         ),
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child:Text(replay[index]));
//   },
// );
        });
  }
}
