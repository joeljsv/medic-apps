import 'package:flutter/material.dart';
import 'package:medic_admin/providers/messages_provider.dart';
import 'package:provider/provider.dart';

import 'screen/dashbord/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => MessagesProvider()),
      ],
          child: MaterialApp(
        title: 'Doctor Panel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HospitalDashboardHome(),
      ),
    );
  }
}
