
import 'package:flutter/material.dart';
import 'package:medic_app/providers/user/user.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:provider/provider.dart';

class Habbits extends StatefulWidget {
  Habbits({Key key}) : super(key: key);

  @override
  _HabbitsState createState() => _HabbitsState();
}

class _HabbitsState extends State<Habbits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LifeStyle",
          style: AppTheme.textTheme.headline2.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                await Provider.of<UserPRovider>(context, listen: false)
                    .changepred();
                Navigator.pop(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LisfeStyleForm(
              optins: [
                "Smoker",
                "Drinks Alcohol",
                "Stopped Smoking",
                "Stopped Alcohol",
                "No Smoking",
                "No Alcohol",
              ],
              title: "Smoking and Alcohol",
            ),
            LisfeStyleForm(
              optins: [
                "Food Allergies",
                "Drug Allergies",
                "Dust Allergies",
                "No Allergies",
              ],
              title: "Allergies",
            ),
            LisfeStyleForm(
              optins: [
                "Under Medication",
                "Hypertention",
                "Cardiac Medication",
                "Diabetes",
                "No Medications",
              ],
              title: "Medication or Illnesses",
            ),
            LisfeStyleForm(
              optins: [
                "Ocupation",
                "Duration of sleep",
                "Relationship Status",
              ],
              title: "Other",
            ),
          ],
        ),
      ),
    );
  }
}

class LisfeStyleForm extends StatefulWidget {
  final String title;
  final bool isPop;
  final List<String> optins;
  const LisfeStyleForm({
    Key key,
    this.title,
    this.optins, this.isPop=true,
  }) : super(key: key);

  @override
  _LisfeStyleFormState createState() => _LisfeStyleFormState();
}

class _LisfeStyleFormState extends State<LisfeStyleForm> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // height: _expand ? widget.optins.length / 2 * 100 : 80,
      duration: Duration(
        microseconds: 800,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                setState(() => _expand = !_expand);
              },
              title: Text(widget.title, style: AppTheme.textTheme.headline5),
              trailing: Icon(
                _expand ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 40,
              ),
            ),
            _expand
                ? Wrap(
                    children: widget.optins
                        .map(
                          (f) => Tiles(
                            isOpn: widget.isPop,
                            f: f,
                          ),
                        )
                        .toList(),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class Tiles extends StatefulWidget {
  final String f;
  final bool isOpn;
  const Tiles({
    Key key,
    this.f, this.isOpn=true,
  }) : super(key: key);

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  bool _selcted = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: _selcted ? AppTheme.appColor.primary : Colors.white,
          border: Border.all(color: AppTheme.appColor.primary, width: 2.0),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: Text(widget.f,
            style: AppTheme.textTheme.caption.copyWith(
              color: _selcted ? Colors.white : AppTheme.appColor.primary,
            )),
      ),
      onTap: () {
        setState(() => _selcted = !_selcted);
        if(widget.isOpn)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("More Abour ${widget.f}"),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Duration",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Medicines",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("SUMMIT"),
              ),
            ],
          ),
        );
      },
    );
  }
}
