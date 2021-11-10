import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyHomePage());
}
class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);
  const MyHomePage({Key? key}) : super(key: key);
  final String title="q";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var ftitle="q";

  void _incrementCounter() {
    setState(() {

      _counter++;
      fireread();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
      appBar: AppBar(
       title: Text(widget.title),
      ),
      body: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many times: ${ftitle}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    )
    );
  }

  void fireadd(){
    FirebaseFirestore.instance
        .collection('todolist')
        .add({'title':"testtitle",'content':"testContent"});
  }
  void fireread(){
    FirebaseFirestore.instance
        .collection('todolist')
        .doc('tSiEyY4kcq4M2SyXBKuH')
        .get()
        .then((doc) {
      print(ftitle);
      setState(() {

        ftitle=doc.get('title');
      });
      print(ftitle);
      print(doc.get('title'));
      print(doc.get('content'));
    });
  }
  void fireupdate(){
    FirebaseFirestore.instance
        .collection('todolist')
        .doc('tSiEyY4kcq4M2SyXBKuH')
        .update({'title':'updatetitle'});

  }
  void firedel(){
    FirebaseFirestore.instance
        .collection('todolist')
        .doc("tSiEyY4kcq4M2SyXBKuH")
        .delete();
  }
}
