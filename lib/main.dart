import 'dart:convert';

import 'package:apidio/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'EMAIL',
                    style: TextStyle(color: Colors.purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Text(
                    'SENHA',
                    style: TextStyle(color: Colors.purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: senha,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      maxLength: 4,
                      obscureText: true,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      var res = await Api().usuario(email.text, senha.text);

                      print(res.length);

                      Navigator.push(context, MaterialPageRoute(builder: (c)=>HomePage()));

                    },
                    color: Colors.greenAccent,
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.accessible_forward),
                Text(' Cadastrar')
              ],
            ),
          ),
        ],
      ),

//      body: Center(
//        child: FutureBuilder(
//            future: Api().funcionario(5),
//            builder: (c, snapshot) {
//              if (snapshot.hasError) {
//                return Text('Erro');
//              }
//              if (snapshot.hasData) {
//
//                return Text(snapshot.data.toString());
////                var listFun = jsonDecode(snapshot.data.data);
//
////                return ListView.builder(
////                    itemCount: listFun.length,
////                    itemBuilder: (context, index) {
////                      return Text(listFun[index]['nome']);
////                    });
//              } else {
//                return Text('data vazio');
//              }
//            }),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Api().deleteFuncionario(1);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
