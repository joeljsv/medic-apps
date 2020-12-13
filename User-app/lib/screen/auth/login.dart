import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../index.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/auth/phoneVerBox.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final bool isLOgin;
  const LoginPage(this.title, {Key key, this.isLOgin = false})
      : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  height: 240,
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  margin: const EdgeInsets.only(top: 100),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFE1E0F5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                              Center(
                                child: Container(
                                    constraints:
                                        const BoxConstraints(maxHeight: 340),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Image.asset('assets/img/login.png')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(widget.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTheme.appColor.primary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800)))
                      ],
                    ),
                  ),
                  LoginOtpBox(widget.isLOgin, phoneController: phoneController)
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => IndexScreen())),
      ),
    );
  }
}
