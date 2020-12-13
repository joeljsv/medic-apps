import 'package:flutter/material.dart';
import 'package:medic_app/providers/auth/auth.dart';
import 'package:medic_app/providers/doctors_provider/doctorProvider.dart';
import 'package:medic_app/providers/doctors_provider/messages_provider.dart';
import 'package:medic_app/providers/user/user.dart';
import 'package:provider/provider.dart';
import 'screen/auth/login.dart';
import 'screen/doctor/doctorDetail/detailDoctor.dart';
import 'providers/doctors_provider/doctorCategory.dart';
import 'providers/location.dart';
import 'screen/home.dart';
import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => SymptomsProvider()),
        ChangeNotifierProvider(create: (context) => Doctorprovider()),
        ChangeNotifierProvider(create: (context) => MessagesProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvder()),
        ChangeNotifierProvider(create: (context) => UserPRovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medic',
        theme: ThemeData(
            colorScheme: AppTheme.appColor,
            primaryColor: AppTheme.appColor.primary,
            accentColor: AppTheme.appColor.secondary,
            appBarTheme: AppTheme.appbartheme,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: AppTheme.appColor.primary,
            )),
        home:
            // LoginPage(),
            LoginPage("GET IN TO\nM E D I C",isLOgin: true,),
        routes: {DoctorDetailScreen.routName: (ctx) => DoctorDetailScreen()},
      ),
    );
  }
}

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
