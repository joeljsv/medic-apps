import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medic_admin/data/socket_io_manager.dart';
import 'package:medic_admin/models/call_api.dart';
import 'package:medic_admin/screen/calling/calling.dart';
import 'package:medic_admin/utils/api.dart';
import 'package:medic_admin/widgets/messages_form.dart';
import 'package:medic_admin/widgets/messages_item.dart';
import 'package:provider/provider.dart';

import '../../providers/messages_provider.dart';
import '../../models/message.dart';

class ChatScreen extends StatefulWidget {
  final String senderName;

  const ChatScreen(this.senderName);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController;

  SocketIoManager _socketIoManager;

  bool _isTyping = false;
  String _userNameTyping;

  void _onTyping() {
    _socketIoManager.sendMessage(
        'typing', json.encode({'senderName': widget.senderName}));
  }

  void _onStopTyping() {
    _socketIoManager.sendMessage(
        'stop_typing', json.encode({'senderName': widget.senderName}));
  }

  void _sendMessage(String messageContent) {
    _socketIoManager.sendMessage(
      'send_message',
      Message(
        widget.senderName,
        messageContent,
        DateTime.now(),
      ).toJson(),
    );

    Provider.of<MessagesProvider>(context, listen: false)
        .addMessage(Message(widget.senderName, messageContent, DateTime.now()));
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _socketIoManager = SocketIoManager(serverUrl: SERVER_URL)
      ..init()
      ..subscribe('receive_message', (Map<String, dynamic> data) {
        Provider.of<MessagesProvider>(context, listen: false)
            .addMessage(Message.fromJson(data));
        _scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
        );
      })
      ..subscribe('typing', (Map<String, dynamic> data) {
        _userNameTyping = data['senderName'];
        setState(() {
          _isTyping = true;
        });
      })
      ..subscribe('stop_typing', (Map<String, dynamic> data) {
        setState(() {
          _isTyping = false;
        });
      })
      ..connect();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _socketIoManager.disconnect();
    super.dispose();
  }

  Call_API api;
  @override
  Widget build(BuildContext context) {
    Future<void> _handleCameraAndMic() async {
      await PermissionHandler().requestPermissions(
        [PermissionGroup.camera, PermissionGroup.microphone],
      );
    }

    Future<void> onJoin() async {
      // update input validation

      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            api: api,
          ),
        ),
      );
    }
  final prov = Provider.of<MessagesProvider>(context, listen: false);
  api = prov.api;
  

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.senderName),
        actions: [
          IconButton(icon: Icon(Icons.video_call), onPressed: () => onJoin())
        ],
      ),
      backgroundColor: Colors.white,
      body:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Consumer<MessagesProvider>(
                      builder: (_, messagesProvider, __) {
                    print(messagesProvider.allMessages.length);
                    if (messagesProvider.allMessages.length < 1) {
                      return Center(
                        child: Text("Send a message to start Chat"),
                      );
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messagesProvider.allMessages.length,
                      itemBuilder: (ctx, index) => MessagesItem(
                        messagesProvider.allMessages[index],
                        messagesProvider.allMessages[index]
                            .isUserMessage(widget.senderName),
                      ),
                    );
                  }),
                ),
                Visibility(
                  visible: _isTyping,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$_userNameTyping is typing',
                          style: Theme.of(context).textTheme.title.copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                        Lottie.asset(
                          'assets/animations/chat-typing-indicator.json',
                          width: 40,
                          height: 40,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                MessageForm(
                  onSendMessage: _sendMessage,
                  onTyping: _onTyping,
                  onStopTyping: _onStopTyping,
                ),
              ],
            )
          
    );
  }
}
