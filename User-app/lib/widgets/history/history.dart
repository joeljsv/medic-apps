import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/theme/theme.dart';

import 'prescription.dart';

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  CustomListItemTwo({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ...

class History extends StatelessWidget {
  final String type;
  const History({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$type History",
          style: AppTheme.textTheme.headline2.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Prescription(
                form:type ,
              )));
            },
            isThreeLine: true,
            leading: Container(
              width: 60,
              decoration: BoxDecoration(
                  color: AppTheme.appColor.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    LineAwesomeIcons.calendar_1,
                    color: Colors.white,
                  ),
                  Text(
                    "OCT 18",
                    style: AppTheme.textTheme.subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "2020",
                    style: AppTheme.textTheme.subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              type=="Lab"?"Venus Lab":"Dr Tessa",
              style: AppTheme.textTheme.headline4,
            ),
            subtitle: Text(
              "For Fever Consulatuion\nKayamakulam PO Pullikanakku",
              style: AppTheme.textTheme.headline6,
            ),
            trailing: Text(
              "₹299",
              style: AppTheme.textTheme.headline4.copyWith(color: Colors.indigo),
            ),
          ),
        ),
      ),
    );
  }
}
