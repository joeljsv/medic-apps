import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

//Image Plugin
import 'package:image_picker/image_picker.dart';
import 'package:medic_app/providers/user/user.dart';
import 'package:medic_app/utils/essentials/loading.dart';
import 'package:provider/provider.dart';


class Document extends StatefulWidget {
  @override
  _DocumentState createState() => new _DocumentState();
}

class _DocumentState extends State<Document> {
  File sampleImage;

  Future getImage() async {
    // ignore: deprecated_member_use
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
  Provider.of<UserPRovider>(context,listen: false).addDoc(sampleImage.toString());
    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Documents'),
        centerTitle: true,
      ),
      body: new Center(
        child: sampleImage == null ? Empty("Add Your Medical Documents") : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          // RaisedButton(
          //   elevation: 7.0,
          //   child: Text('Upload'),
          //   textColor: Colors.white,
          //   color: Colors.blue,
          //   onPressed: () {
        
              
          //   },
          // )
        ],
      ),
    );
  }
}