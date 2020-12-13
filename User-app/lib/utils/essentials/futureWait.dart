import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FutureHandleing extends StatelessWidget {
  final AsyncSnapshot<dynamic> snap;
  const FutureHandleing(this.snap, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snap.connectionState == ConnectionState.waiting) {
      return LoadingHeart();
    } else if (snap.hasError) {
      return Center(
        child: Text("An Error Occured"),
      );
    } else {
      return Center(
        child: Text(
          "Oops!\n Somthing went wrong!",
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

class LoadingHeart extends StatelessWidget {
  const LoadingHeart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading.json',
        fit: BoxFit.contain,
        alignment: Alignment.center,
        height: 100,
        width: 100
      ),
    );
  }
}
