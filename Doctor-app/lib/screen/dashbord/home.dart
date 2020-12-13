import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:medic_admin/providers/messages_provider.dart';
import 'package:provider/provider.dart';

import 'accountcard.dart';
import 'appintments.dart';
import 'chartpainter.dart';

Color primaryColor = Color(0xff0074ff);

class HospitalDashboardHome extends StatelessWidget {
  const HospitalDashboardHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTok() async {
      final prov = Provider.of<MessagesProvider>(context, listen: false);
      await prov.getToken();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      // bottomNavigationBar:
      body:  FutureBuilder(
          future: getTok(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            return _buildBody(context);
          }),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Medic Doctor Panel'),
      backgroundColor: primaryColor,
      elevation: 0,
      actions: <Widget>[
        Icon(Icons.notifications),
        Container(
          width: 50,
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                child: Icon(FontAwesomeIcons.user, color: Colors.blue),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(
                  //       "https://htmlstream.com/preview/unify-v2.6.3/assets/img-temp/400x450/img5.jpg"),
                  // ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00ff1d),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }



  Widget _buildBody(BuildContext context) {
    final DateTime tim=DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xff4d9eff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Monthly",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter: ChartPainter(),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: _buildChartLegend(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(context, child: AppointmentCard()),
                  SizedBox(height: 20),
                  Text(
                    "Today (${DateFormat("dd MMMM").format(tim)})",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Joel Sunny',
                      id: 'ID: AA741',
                      hour: '${DateFormat.jm().format(tim.subtract(Duration(hours: 0,minutes: 2)))}',
                      active: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Akshay A',
                      id: 'ID: BA953',
                      hour: '${DateFormat.jm().format(tim.subtract(Duration(hours: 1,minutes: 12)))}',
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Neha',
                      id: 'ID: DD5666',
                      hour: '${DateFormat.jm().format(tim.subtract(Duration(hours: 1,minutes:46)))}',
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }

  String getMonth(int index) {
    final months = [ 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct','Nov'];
    return months[index];
  }
}
