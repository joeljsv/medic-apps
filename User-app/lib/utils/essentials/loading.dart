import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medic_app/theme/theme.dart';

class TypingLoading extends StatelessWidget {
  const TypingLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'assets/lottie/chat-typing-indicator.json',
        width: 40,
        height: 30,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

class ChatWaiting extends StatelessWidget {
  final String title;
  const ChatWaiting(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.caption,
          ),
          Lottie.asset(
            'assets/lottie/chat.json',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}

class Empty extends StatelessWidget {
  final String title;
  const Empty(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   title,
          //   style: AppTheme.textTheme.caption,
          // ),
          Lottie.asset(
            'assets/lottie/empty.json',
            fit: BoxFit.contain,
            width: 200,
            height: 200,
            alignment: Alignment.center,
          ),
          Text(
            "Uho!!\n$title",
            style: AppTheme.textTheme.headline6,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class WaitConfirmLo extends StatelessWidget {
  final bool isConfirm;
  const WaitConfirmLo(this.isConfirm, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   title,
          //   style: AppTheme.textTheme.caption,
          // ),
          Lottie.asset(
            
            isConfirm
                ? 'assets/lottie/confirm.json'
                : 'assets/lottie/wait.json',
            fit: BoxFit.contain,
            width: 200,
            height: 200,
            alignment: Alignment.center,
          ),
          Text(
            isConfirm
                ? "Confirmed Your Appointment"
                : "We are Calling To Confirm your appointment",
            style: AppTheme.textTheme.headline6,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
