import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  bool chance = true;
  String marker;
  String one = '-';
  String two = '-';
  String three = '-';
  String four = '-';
  String five = '-';
  String six = '-';
  String seven = '-';
  String eight = '-';
  String nine = '-';
  TextStyle temp1 =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500);
  bool lock1 = true;
  bool lock2 = true;
  bool lock3 = true;
  bool lock4 = true;
  bool lock5 = true;

  bool lock6 = true;
  bool lock7 = true;
  bool lock8 = true;
  bool lock9 = true;

  int xcount = 0;
  int ocount = 0;

  // void write( ) {
  //   if (chance == true) {

  //     setState(() {
  //       three = 'O';
  //       chance = false;

  //     });
  //   } else {
  //     setState(() {
  //       three = 'X';
  //       chance = true;
  //     });
  //   }
  // }

  clearboard() {
    setState(() {
      one = two = three = four = five = six = seven = eight = nine = '-';
      lock1 =
          lock2 = lock3 = lock4 = lock5 = lock6 = lock7 = lock8 = lock9 = true;
    });
  }

  check() {
    if ((one == 'X' && two == 'X' && three == 'X' ||
        one == 'X' && four == 'X' && seven == 'X' ||
        seven == 'X' && eight == 'X' && nine == 'X' ||
        nine == 'X' && six == 'X' && three == 'X' ||
        one == 'X' && five == 'X' && nine == 'X' ||
        three == 'X' && five == 'X' && seven == 'X' ||
        four == 'X' && five == 'X' && six == 'X' ||
        two == 'X' && five == 'X' && eight == 'X')) {
      print('winning case X');
      // return alert;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
                child: AlertDialog(
                  title: Text('X Player won'),
                  content: Text('  Congratulations.'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        setState(() {
                          xcount++;
                        });
                        clearboard();
                        Navigator.pop(context);
                      },
                      child: new Text('Go Back'),
                    ),
                  ],
                ),
                onWillPop: () {});
          });
    } else if ((one == 'O' && two == 'O' && three == 'O' ||
            one == 'O' && four == 'O' && seven == 'O' ||
            seven == 'O' && eight == 'O' && nine == 'O' ||
            nine == 'O' && six == 'O' && three == 'O') ||
        one == 'O' && five == 'O' && nine == 'O' ||
        three == 'O' && five == 'O' && seven == 'O' ||
        four == 'O' && five == 'O' && six == 'O' ||
        two == 'O' && five == 'O' && eight == 'O') {
      print('winning case O');
      // return alert;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
                child: AlertDialog(
                  title: Text('O Player won'),
                  content: Text('  Congratulations.'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        setState(() {
                          ocount++;
                        });
                        clearboard();
                        Navigator.pop(context);
                      },
                      child: new Text('Go Back'),
                    ),
                  ],
                ),
                onWillPop: () {});
          });
    } else if (one != '-' &&
        two != '-' &&
        three != '-' &&
        four != '-' &&
        five != '-' &&
        six != '-' &&
        seven != '-' &&
        eight != '-' &&
        nine != '-') {
      print('Draw');
      // return alert;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
                child: AlertDialog(
                  title: Text('Match Deawn'),
                  content: Text('  Congratulations both of you '),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        clearboard();
                        Navigator.pop(context);
                      },
                      child: new Text('Go Back'),
                    ),
                  ],
                ),
                onWillPop: () {});
          });
    }
  }

  oneFun() {
    if (lock1 == true) {
      print('lok true');
      if (chance == true) {
        setState(() {
          one = 'O';
          chance = false;
          lock1 = false;
        });
        Firestore.instance
            .collection('sarang')
            .document()
            .setData({'test': '$one'});
        check();
      } else {
        setState(() {
          one = 'X';
          chance = true;
          lock1 = false;
        });
        Firestore.instance
            .collection('sarang')
            .document()
            .setData({'test': '$one'});
        check();
      }
    }
  }

  twoFun() {
    if (lock2 == true) {
      if (chance == true) {
        setState(() {
          two = 'O';
          chance = false;
          lock2 = false;
        });
        check();
      } else {
        setState(() {
          two = 'X';
          chance = true;
          lock2 = false;
        });
        check();
      }
    }
  }

  threeFun() {
    if (lock3 == true) {
      if (chance == true) {
        setState(() {
          three = 'O';
          chance = false;
          lock3 = false;
        });
        check();
      } else {
        setState(() {
          three = 'X';
          chance = true;
          lock3 = false;
        });
        check();
      }
    }
  }

  fourFun() {
    if (lock4 == true) {
      if (chance == true) {
        setState(() {
          four = 'O';
          chance = false;
          lock4 = false;
        });
        check();
      } else {
        setState(() {
          four = 'X';
          chance = true;
          lock4 = false;
        });
        check();
      }
    }
  }

  fiveFun() {
    if (lock5 == true) {
      if (chance == true) {
        setState(() {
          five = 'O';
          chance = false;
          lock5 = false;
        });
        check();
      } else {
        setState(() {
          five = 'X';
          chance = true;
          lock5 = false;
        });
        check();
      }
    }
  }

  sixFun() {
    if (lock6 == true) {
      if (chance == true) {
        setState(() {
          six = 'O';
          chance = false;
          lock6 = false;
          check();
        });
      } else {
        setState(() {
          six = 'X';
          chance = true;
          lock6 = false;
        });
        check();
      }
    }
  }

  sevenFun() {
    if (lock7 == true) {
      if (chance == true) {
        setState(() {
          seven = 'O';
          chance = false;
          lock7 = false;
          check();
        });
      } else {
        setState(() {
          seven = 'X';
          chance = true;
          lock7 = false;
        });
        check();
      }
    }
  }

  eightFun() {
    if (lock8 == true) {
      if (chance == true) {
        setState(() {
          eight = 'O';
          chance = false;
          lock8 = false;
          check();
        });
      } else {
        setState(() {
          eight = 'X';
          chance = true;
          lock8 = false;
        });
        check();
      }
    }
  }

  nineFun() {
    if (lock9 == true) {
      if (chance == true) {
        setState(() {
          nine = 'O';
          chance = false;
          lock9 = false;
        });
        check();
      } else {
        setState(() {
          nine = 'X';
          chance = true;
          lock9 = false;
        });
        check();
      }
    }
  }

  nullhide() {
    if (one != null) {
      setState(() {
        //temp= TextStyle(color: Colors.black);
      });
    } else {
      setState(() {
        //temp= TextStyle(color: Colors.white);
      });
    }
  }

  @override
  void initState() {
    nullhide();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zero-Cross',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(112, 112, 112, 1),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(3, 40, 252, 1),
                    Color.fromRGBO(3, 121, 252, 1),
                  ])),
        ),
      ),
      // body: GridView.count(
      //   // Create a grid with 2 columns. If you change the scrollDirection to
      //   // horizontal, this produces 2 rows.
      //   crossAxisCount: 3,
      //   // Generate 100 widgets that display their index in the List.
      //   children: List.generate(9, (index) {

      //     return InkWell(
      //       onTap: (){write( index);},
      //       splashColor: Colors.black,

      //       child: Container(

      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           Text(
      //         '$marker$index',
      //         style: Theme.of(context).textTheme.headline,
      //       ),

      //       // Icon(  (Icons.$chance)),
      //        //Icon(  (Icons.cancel))
      //       ],)
      //     ),
      //     );
      //   }),
      // )

      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: <Widget>[
           SizedBox(height: MediaQuery.of(context).size.height / 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'X Score',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  'O Score',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$xcount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Colors.black54),
                ),
                Text('$ocount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Colors.black54),),
              ],
            ),
             SizedBox(height: MediaQuery.of(context).size.height / 25),
            
            // StreamBuilder<QuerySnapshot>(
            //     stream: Firestore.instance
            //         .collection('rooms')
            //         .snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         return Text('Error aaya ye wala ${snapshot.error}');
            //       }

            //       switch (snapshot.connectionState) {
            //         // case ConnectionState.waiting:
            //         //   return CircularProgressIndicator();
            //         case ConnectionState.none:
            //           // return CircularProgressIndicator();
            //           return Text('none');

            //         default:
            //           if (snapshot.data == null) {
            //             return Expanded(
            //                 child: Container(
            //               child: Column(
            //                 children: <Widget>[
            //                   CircularProgressIndicator(),
            //                   Text(' Please wait for workers to bid'),
            //                 ],
            //               ),
            //             ));
            //           } else {
            //             return ListView(
            //                 children: snapshot.data.documents
            //                     .map((DocumentSnapshot document) {
            //               return ListTile(
            //                 title: Text(document['bidamt'].toString()),
            //                 subtitle: Text(document['name']),
            //                 trailing: Image.network(
            //                   document['photu'],
            //                   loadingBuilder: (BuildContext context,
            //                       Widget child,
            //                       ImageChunkEvent loadingProgress) {
            //                     if (loadingProgress == null) return child;

            //                     return Row(
            //                       // crossAxisAlignment: CrossAxisAlignment.start,
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: <Widget>[
            //                         CircularProgressIndicator(
            //                           value: loadingProgress
            //                                       .expectedTotalBytes !=
            //                                   null
            //                               ? loadingProgress
            //                                       .cumulativeBytesLoaded /
            //                                   loadingProgress.expectedTotalBytes
            //                               : null,
            //                         ),
            //                       ],
            //                     );
            //                   },
            //                 ),
            //               );
            //             }).toList());
            //           }
            //       }
            //     }),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    oneFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    //color: Color.fromRGBO(112, 112, 112, 1),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(3, 40, 252, 1),
                              Color.fromRGBO(3, 121, 252, 1),
                            ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$one',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    twoFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$two',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    threeFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(3, 40, 252, 1),
                              Color.fromRGBO(3, 121, 252, 1),
                            ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$three',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    fourFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$four',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    fiveFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$five',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    sixFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$six',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    sevenFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(3, 40, 252, 1),
                              Color.fromRGBO(3, 121, 252, 1),
                            ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$seven',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    eightFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color.fromRGBO(3, 40, 252, 1),
                          Color.fromRGBO(3, 121, 252, 1),
                        ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$eight',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    nineFun();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(3, 40, 252, 1),
                              Color.fromRGBO(3, 121, 252, 1),
                            ])),
                    child: Container(
                      child: Center(
                        child: Text(
                          '$nine',
                          style: temp1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         'Zero-Cross',
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       centerTitle: true,
  //       backgroundColor: Color.fromRGBO(112, 112, 112, 1),
  //     ),
  //     // body: GridView.count(
  //     //   // Create a grid with 2 columns. If you change the scrollDirection to
  //     //   // horizontal, this produces 2 rows.
  //     //   crossAxisCount: 3,
  //     //   // Generate 100 widgets that display their index in the List.
  //     //   children: List.generate(9, (index) {

  //     //     return InkWell(
  //     //       onTap: (){write( index);},
  //     //       splashColor: Colors.black,

  //     //       child: Container(

  //     //       child: Column(
  //     //         mainAxisAlignment: MainAxisAlignment.center,
  //     //         crossAxisAlignment: CrossAxisAlignment.center,
  //     //         children: <Widget>[
  //     //           Text(
  //     //         '$marker$index',
  //     //         style: Theme.of(context).textTheme.headline,
  //     //       ),

  //     //       // Icon(  (Icons.$chance)),
  //     //        //Icon(  (Icons.cancel))
  //     //       ],)
  //     //     ),
  //     //     );
  //     //   }),
  //     // )

  //     body: Container(
  //       child: Column(
  //         children: <Widget>[

  //           SizedBox(height: MediaQuery.of(context).size.height / 5 ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               InkWell(
  //                 onTap: () {
  //                   oneFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$one',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   twoFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$two',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   threeFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$three',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               InkWell(
  //                 onTap: () {
  //                   fourFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$four',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   fiveFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$five',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   sixFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$six',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               InkWell(
  //                 onTap: () {
  //                   sevenFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$seven',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   eightFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$eight',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   nineFun();
  //                 },
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height / 7,
  //                   width: MediaQuery.of(context).size.height / 7,
  //                   color: Color.fromRGBO(112, 112, 112, 1),
  //                   child: Container(
  //                     child: Center(
  //                       child: Text(
  //                         '$nine',
  //                         style: temp1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
