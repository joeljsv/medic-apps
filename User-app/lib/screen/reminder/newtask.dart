import 'package:flutter/material.dart';
import 'package:medic_app/screen/reminder/reminder.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/reminder/backBtn.dart';
import 'package:medic_app/widgets/reminder/testFeild.dart';
import 'package:medic_app/widgets/reminder/topContainer.dart';

class CreateNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new Reminder',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(label: 'Title'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                          HomePage.calendarIcon(),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                        label: 'Start Time',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 40),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    label: 'Description',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 0,
                          //textDirection: TextDirection.rtl,
                          spacing: 10.0,
                          children: <Widget>[
                            Chip(
                              label: Text("Consultaion"),
                              backgroundColor:  AppTheme.appColor.primary,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            Chip(
                              label: Text("Work Outs"),
                            ),
                            Chip(
                              label: Text("Take Medicine"),
                            ),
                            Chip(
                              label: Text("Appointments"),
                            ),
                            Chip(
                              label: Text("Other"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Create Reminder',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: AppTheme.appColor.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}