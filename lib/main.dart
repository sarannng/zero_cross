import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zero_cross/game%20copy%202.dart';
import 'package:zero_cross/game%20copy.dart';
import 'package:zero_cross/game.dart';

const String testDevice = '10AB33EB9DB41BD33DA71FA3167C2D11';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero_cross',
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
  TextEditingController _createroom = TextEditingController();
  final _joinroom = TextEditingController();
  String docid;
  String roomid;

  show() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              child: AlertDialog(
                title: Text('O player won'),
                content: Text('  Congratulations.'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      // clearboard();
                      Navigator.pop(context);
                    },
                    child: new Text('Start again'),
                  ),
                ],
              ),
              onWillPop: () {});
        });
  }

  final FirebaseMessaging _messaging = FirebaseMessaging();

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      // contentUrl: 'https://flutter.io',
      // //birthday: DateTime.now(),
      // childDirected: false,
      //designedForFamilies: false,
      //gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: testDevice != null ? <String>[testDevice] : null,
      nonPersonalizedAds: true // Android  are considered test devices
      );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-8326620147658556/6344287317',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print('Banner ad $event');
        });
  }

  createroom() {
    setState(() {
      docid = _createroom.text;
    });
    Firestore.instance.collection('rooms').document('$docid').setData({
      'chance': true,
      //'playerin': false, not in use right now
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
      'creater': false,
      'joiner': false,
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
            builder: (BuildContext context) => GameMp(docid1: docid)));
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
    _controller = new TabController(length: 2, vsync: this);
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-8326620147658556~5047764930");

    _bannerAd = createBannerAd()
      ..load()
      ..show(
        // anchorOffset: 60.0,
        // // Positions the banner ad 10 pixels from the center of the screen to the right
        // horizontalCenterOffset: 10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    _messaging.getToken().then((token) {
      print(token);
    });
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer start
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: ((MediaQuery.of(context).size.height) / 2),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(3, 40, 252, 1),
                      Color.fromRGBO(3, 121, 252, 1),
                    ],
                  ),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // Icon(
                              //   Icons.account_circle,
                              //   size: 150,
                              //   color: Colors.white,
                              // ),
                              Container(
                                  width: 190.0,
                                  height: 190.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://firebasestorage.googleapis.com/v0/b/jeevika-2532066.appspot.com/o/passport.jpg?alt=media&token=497001c9-0364-4699-a196-cf00807f1451")))),
                              // Image.network(
                              //   'https://firebasestorage.googleapis.com/v0/b/jeevika-2532066.appspot.com/o/passport.jpg?alt=media&token=497001c9-0364-4699-a196-cf00807f1451',
                              //   height: 150,
                              //   width: 150,
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Sarthak Jain',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '235653313665',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Leaderboard'),
              trailing: Icon(Icons.add_circle),
            ),
            Divider(),
            ListTile(
              title: Text('How to play??'),
              trailing: Icon(Icons.add_circle),
            ),
            Divider(),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.add_circle),
            ),
            Divider(),
            ListTile(
              title: Text('Developer Info'),
              trailing: Icon(Icons.add_circle),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            Divider(),
          ],
        ),
      ),
      //Drawer ends
      appBar: AppBar(
        elevation: 5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(3, 40, 252, 1),
                Color.fromRGBO(3, 121, 252, 1),
              ])),
        ),
        centerTitle: true,
        title: Text('Zero-Cross'),
        // leading: IconButton(
        //     icon: Icon(Icons.router),
        //     onPressed: () {
        //       // Navigator.push(
        //       //     context,
        //       //     MaterialPageRoute(
        //       //         builder: (BuildContext context) =>
        //       //             GameMp(docid1: docid)));
        //     }),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/demo.png',
              width: 200,
              height: 200,
            ),
            Divider(),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Play Game Offline',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
                    child: RaisedButton(
                      onPressed: () {
                        print('tap');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Game()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(29, 191, 34, 1),
                                Color.fromRGBO(30, 201, 36, 1),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                              minWidth: 88.0,
                              minHeight:
                                  36.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'Start Offline Game',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Play with friends',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                decoration: new BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ]),
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
              height: MediaQuery.of(context).size.height / 7,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  new Card(
                    color: Colors.white70,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: TextField(
                        controller: _createroom,
                        decoration: const InputDecoration(
                            hintText: 'Tap on mobile icon for passkey'),
                      ),
                      subtitle:
                          Text('Copy this passkey and share it to your friend'),
                      leading: IconButton(
                          icon: Icon(
                            Icons.phonelink_setup,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print('tap');
                            var rng = new Random();
                            var code = rng.nextInt(900000) + 100000;

                            print(code);
                            setState(() {
                              _createroom.text = code.toString();
                            });
                          }),
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
                            hintText: 'Enter Password to join room'),
                      ),
                      //leading: const Icon(Icons.home),

                      subtitle: Text('Enter the passkey shared by your friend'),
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
