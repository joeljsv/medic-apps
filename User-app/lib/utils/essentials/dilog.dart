import 'package:flutter/material.dart';

import 'futureWait.dart';

Future<void> loadingDilog(BuildContext context) async {
  return showDialog<void>(

    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        // title: Text('AlertDialog Title'),
        content: LoadingHeart(),
        // actions: <Widget>[
        //   TextButton(
        //     child: Text('Approve'),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}