import 'package:flutter/material.dart';
import 'package:medic_app/providers/auth/auth.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/loading.dart';
class WaitConfirm extends StatefulWidget {
  WaitConfirm({Key key}) : super(key: key);

  @override
  _WaitConfirmState createState() => _WaitConfirmState();
}

bool _confirm = false;

class _WaitConfirmState extends State<WaitConfirm> {
  @override
  Widget build(BuildContext context) {
    
//      call()async{
//  await Provider.of<AuthProvder>(context, listen: false).confirm();
//      }
    return Scaffold(
      backgroundColor: _confirm?AppTheme.appColor.primary:Colors.white,
      body: Center(
        child: WaitConfirmLo(_confirm),
      ),
      floatingActionButton: GestureDetector(
        
        onTap: () {
          print("d");
          setState(() {
            _confirm = true;
          });
        },
        child: Container(
                 color: Colors.transparent,         
          height: 100,
          width: 100,
        ),
       
      ),
    );
  }
}
