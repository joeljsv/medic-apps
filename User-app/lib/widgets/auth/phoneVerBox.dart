import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_app/providers/auth/auth.dart';
import 'package:medic_app/screen/auth/otpPage.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/utils/essentials/dilog.dart';
import 'package:provider/provider.dart';

class LoginOtpBox extends StatelessWidget {
  final bool isLogin;
  const LoginOtpBox(this.isLogin,{
    Key key,
    @required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Container(
              constraints: const BoxConstraints(maxWidth: 500),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'We will send you an ',
                      style: TextStyle(color: AppTheme.appColor.primary)),
                  TextSpan(
                      text: 'One Time Password ',
                      style: TextStyle(
                          color: AppTheme.appColor.primary,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'on this mobile number',
                      style: TextStyle(color: AppTheme.appColor.primary)),
                ]),
              )),
          Container(
            height: 40,
            constraints: const BoxConstraints(maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              controller: phoneController,
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.phone,
              autofillHints: [AutofillHints.telephoneNumber],
              prefix: Text("+91"),
              maxLength: 10,
              maxLines: 1,
              placeholder: '9445557799',
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 500),
            child: RaisedButton(
              onPressed: () async {
                if (phoneController.text.isNotEmpty) {
                  try {
                    FocusScope.of(context).unfocus();
                    loadingDilog(context);
                    await Provider.of<AuthProvder>(context, listen: false)
                        .otpRequest(phoneController.text);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => OtpPage(isLogin)));
                  } catch (e) {
                    print(e);
                    Navigator.pop(context);
                    final snackBar = SnackBar(
                      content: Text('An error occured'),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                } else {
                  final snackBar = SnackBar(
                    content: Text('Please enter a phone number'),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              color: AppTheme.appColor.primary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: AppTheme.appColor.primary,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
