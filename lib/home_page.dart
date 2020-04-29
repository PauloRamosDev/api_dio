import 'dart:io';

import 'package:apidio/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  HomePage();


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var fileName = 'Selecione um arquivo';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(fileName),
            RaisedButton(onPressed: () async {
              File file = await FilePicker.getFile();


              if (file != null) {
                fileName = file.path;

                setState(() {

                });

                var api = Api();

                await api.uploadFile(file.path);
              }
            }, child: Text('buscar'),)
          ],
        ),
      ),
    );
  }
}
