import 'package:flutter/material.dart';
import 'package:medic_app/screen/profile/fit.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/reminder/activeCard.dart';
import 'package:medic_app/widgets/reminder/taskColumn.dart';
import 'package:medic_app/widgets/reminder/topContainer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'calenderPage.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: AppTheme.appColor.primary,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: AppTheme.appColor.primary,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor:  AppTheme.appColor.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Icon(Icons.menu,
                        //     color:  AppTheme.appColor.primary, size: 30.0),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            await read();
                          },
                          child: Icon(Icons.sync,
                              color: AppTheme.appColor.primary, size: 25.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: AppTheme.appColor.secondary,
                            backgroundColor: AppTheme.appColor.primary,
                            center: CircleAvatar(
                              backgroundColor: AppTheme.appColor.primary,
                              radius: 35.0,
                              backgroundImage: NetworkImage(
                                'https://www.webxcreation.com/event-recruitment/images/profile-1.jpg',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'You may have chance of\nCardiac diseases',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: AppTheme.appColor.primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Based on your lifestyle and previous\nhealth data',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Chip(
                                label: Text("Consult Now",
                                    style: AppTheme.textTheme.headline5
                                        .copyWith(color: Colors.white)),
                                backgroundColor: AppTheme.appColor.primary,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Goals'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: AppTheme.appColor.primary,
                            title: 'Exercise',
                            subtitle: '15k cal to Burn',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: AppTheme.appColor.primary,
                            title: 'Sleep',
                            subtitle: 'Daily 9hrs',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: AppTheme.appColor.primary,
                            title: 'Take Medicines',
                            subtitle: 'min 2 ltrs',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading("Goal progress"),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: AppTheme.appColor.secondary,
                                loadingPercent: 0.25,
                                title: 'Clories Burn',
                                subtitle: 'Updated Just Now',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: AppTheme.appColor.secondary,
                                loadingPercent: 0.6,
                                title: 'Daily Sleep',
                                subtitle: 'Updated Just Now',
                              ),
                            ],
                          ),
                          // Row(
                          //   children: <Widget>[
                          //     ActiveProjectsCard(
                          //       cardColor: Colors.orange,
                          //       loadingPercent: 0.45,
                          //       title: 'Sports App',
                          //       subtitle: '5 hours progress',
                          //     ),
                          //     SizedBox(width: 20.0),
                          //     ActiveProjectsCard(
                          //       cardColor:  Colors.blue,
                          //       loadingPercent: 0.9,
                          //       title: 'Online Flutter Course',
                          //       subtitle: '23 hours progress',
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
