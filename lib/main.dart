import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zero_cross/game%20copy%202.dart';
import 'package:zero_cross/game%20copy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final _createroom = TextEditingController();
  final _joinroom = TextEditingController();
  String docid;
  String roomid;
  createroom() {
    setState(() {
      docid = _createroom.text;
    });
    Firestore.instance.collection('rooms').document('$docid').setData({
      'control': true,
      'playerin': false,
      'turn': true, 
      '1': '-',
      '2': '-',
      '3': '-',
      '4': '-',
      '5': '-',
      '6': '-',
      '7': '-',
      '8': '-',
      '9': '-',
      'lock1': true,
      'lock2': true,
      'lock3': true,
      'lock4': true,
      'lock5': true,
      'lock6': true,
      'lock7': true,
      'lock8': true,
      'lock9': true,
    });

     Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          GameMp(docid1: docid)));
  }

  joinroom() {
    setState(() {
      roomid = _joinroom.text;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GameMp1(
                  docid1: roomid,
                )));
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Zero-Cross'),
        leading: IconButton(
            icon: Icon(Icons.router),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             GameMp(docid1: docid)));
            }),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: new TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black12,
                  controller: _controller,
                  tabs: [
                    new Tab(
                      icon: const Icon(Icons.create),
                      text: 'Create Room',
                    ),
                    new Tab(
                      icon: const Icon(Icons.receipt),
                      text: 'Join Room',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80.0,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  new Card(
                    child: ListTile(
                      title: TextField(
                        controller: _createroom,
                        decoration: const InputDecoration(
                            hintText: 'Enter the room password'),
                      ),
                      //leading: const Icon(Icons.home),
                      trailing: IconButton(
                          icon: Icon(Icons.send),
                          color: Color.fromRGBO(24, 24, 4, 1),
                          onPressed: () {
                            print(_createroom.text);
                            createroom();
                          }),
                    ),
                  ),
                  new Card(
                    child: new ListTile(
                      title: new TextField(
                        controller: _joinroom,
                        decoration: const InputDecoration(
                            hintText: 'Enter the room password'),
                      ),
                      //leading: const Icon(Icons.home),
                      trailing: IconButton(
                          icon: Icon(Icons.send),
                          color: Color.fromRGBO(24, 24, 4, 1),
                          onPressed: () {
                            joinroom();
                          }),
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
