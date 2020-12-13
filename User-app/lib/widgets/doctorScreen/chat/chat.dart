import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medic_app/data/socket_io_manager.dart';
import 'package:medic_app/models/doctor/message.dart';
import 'package:medic_app/providers/doctors_provider/messages_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medic_app/utils/apis/server.dart';
import 'package:medic_app/utils/essentials/loading.dart';
import '../../../screen/calling/calling.dart';
import 'package:provider/provider.dart';
import '../../../models/call_api.dart';
import 'messages_form.dart';
import 'messages_item.dart';

class ChatScreen extends StatefulWidget {
  final String senderName;
 final Call_API api;
  const ChatScreen(
    this.senderName,
    this.api
  );

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
Future<void> onJoin() async {
    // update input validation
   
     // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            api: widget.api,
          ),
        ),
      );
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr. ${widget.senderName}"),
        actions: [
          IconButton(onPressed: ()=>onJoin(),icon: Icon(Icons.video_call),)
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: _isTyping,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: typinG(context),
            ),
          ),
          Expanded(
            child:
                Consumer<MessagesProvider>(builder: (_, messagesProvider, __) {
              print(messagesProvider.allMessages.length);
              if (messagesProvider.allMessages.length < 1) {
                return ChatWaiting(
                    "Waiting ${widget.senderName.split(" ")[0]} to join...");
              }
              return ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: messagesProvider.allMessages.length,
                itemBuilder: (ctx, index) => MessagesItem(
                    messagesProvider.allMessages[index],
                    messagesProvider.allMessages[index]
                        .isUserMessage(widget.senderName),
                    widget.senderName),
              );
            }),
          ),
          MessageForm(
            onSendMessage: _sendMessage,
            onTyping: _onTyping,
            onStopTyping: _onStopTyping,
          ),
        ],
      ),
    );
  }

  Row typinG(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(),
        Text(
          '${widget.senderName.split(" ")[0]} is typing',
          style: Theme.of(context).textTheme.caption.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
        ),
        TypingLoading(),
        Spacer(),
      ],
    );
  }
}
