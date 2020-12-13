import 'package:flutter/material.dart';
import 'package:medic_app/screen/reminder/dates_list.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/reminder/backBtn.dart';
import 'package:medic_app/widgets/reminder/calenderDate.dart';
import 'package:medic_app/widgets/reminder/taskConatiner.dart';

import 'newtask.dart';

class CalendarPage extends StatelessWidget {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:AppTheme.appColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color:AppTheme.appColor.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewTaskPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Add Reminder',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
           
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'December, 2020',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 58.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 0 ? AppTheme.appColor.primary : Colors.black54,
                      dateColor:
                          index == 0 ? AppTheme.appColor.primary : AppTheme.appColor.secondary,
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${time[index]} ${time[index] > 8 ? 'AM' : 'PM'}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Medicine',
                                subtitle:
                                    'Antiarrhythmic medicines.Anticoagulant medicines.',
                                boxColor: AppTheme.appColor.secondary,
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Work Out',
                                subtitle: 'Jogging\nfor 1 hours',
                                boxColor: AppTheme.appColor.secondary,
                              ),
                              TaskContainer(
                                title: 'Appointment',
                                subtitle: 'Appintment at Dr.David\nAbout 15mins away',
                                boxColor:AppTheme.appColor.secondary,
                              ),
                              TaskContainer(
                               title: 'Medicine',
                                subtitle:
                                    'Antiarrhythmic medicines.Anticoagulant medicines.',
                                boxColor: AppTheme.appColor.secondary,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}