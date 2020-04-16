import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameMp extends StatefulWidget {
  final String docid1;

  const GameMp({Key key, this.docid1}) : super(key: key);

  _GameMpState createState() => _GameMpState();
}

class _GameMpState extends State<GameMp> {
  bool chance;
  bool turn;
  String marker;
  String one;
  String two;
  String three;
  String four;
  String five;
  String six;
  String seven;
  String eight;
  String nine;

  TextStyle temp1 =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500);
  bool lock1;
  bool lock2;
  bool lock3;
  bool lock4;
  bool lock5;

  bool lock6;
  bool lock7;
  bool lock8;
  bool lock9;

  String docid;
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

  queryfun(String vari, String datum) {
    print('========================');
    print(vari);
    print(datum);
    print('========================');
    Firestore.instance
        .collection('rooms')
        .document('${widget.docid1}')
        .updateData({
      vari: datum,
    });
  }

  getboardvalue() {
    var data = Firestore.instance
        .collection('rooms')
        .document('${widget.docid1}')
        .snapshots();
    data.listen((onValue) async {
      //  return await onValue.data['$variable'];

      setState(() {
        one = onValue.data['1'];
        two = onValue.data['2'];
        three = onValue.data['3'];
        four = onValue.data['4'];
        five = onValue.data['5'];
        six = onValue.data['6'];
        seven = onValue.data['7'];
        eight = onValue.data['8'];
        nine = onValue.data['9'];

        chance = onValue.data['control'];
        turn = onValue.data['control'];

        lock1 = onValue.data['lock1'];
        lock2 = onValue.data['lock2'];
        lock3 = onValue.data['lock3'];
        lock4 = onValue.data['lock4'];
        lock5 = onValue.data['lock5'];
        lock6 = onValue.data['lock6'];
        lock7 = onValue.data['lock7'];
        lock8 = onValue.data['lock8'];
        lock9 = onValue.data['lock9'];

        print(one);
      });
    });
  }

  // callinggetvalue() {
  //   setState(()   {
  //     print(getboardvalue('1'));
  //     //one =   getboardvalue('1');
  //     two = getboardvalue('2');
  //     three = getboardvalue('3');
  //     four = getboardvalue('4');
  //     five = getboardvalue('5');
  //     six = getboardvalue('6');
  //     seven = getboardvalue('7');
  //     eight = getboardvalue('8');
  //     nine = getboardvalue('9');
  //   });
  // }

  clearboard() {
    setState(() {
      one = two = three = four = five = six = seven = eight = nine = '-';
      lock1 =
          lock2 = lock3 = lock4 = lock5 = lock6 = lock7 = lock8 = lock9 = true;

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
                        clearboard();
                        Navigator.pop(context);
                      },
                      child: new Text('Start again'),
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
                  title: Text('O player won'),
                  content: Text('  Congratulations.'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        clearboard();
                        Navigator.pop(context);
                      },
                      child: new Text('Start again '),
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
      print('winning case O');
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
    if (turn == true) {
      if (lock1 == true) {
        print('lok true');
        if (chance == true) {
          setState(() {
            one = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock1': false});
          });

          // Firestore.instance
          //     .collection('rooms')
          //     .document('${widget.docid1}')
          //     .updateData({
          //       '1': '$one',
          //     });
          queryfun('1', '$one');
          check();
        } else {
          setState(() {
            one = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock1': false});
          });
          // Firestore.instance
          //     .collection('rooms')
          //     .document('${widget.docid1}')
          //     .updateData({
          //       '1': '$one',
          //     });
          queryfun('1', '$one');
          check();
        }
      }
    }
  }

  twoFun() {
    if (turn == true) {
      if (lock2 == true) {
        if (chance == true) {
          setState(() {
            two = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock2': false});
          });
          check();
          queryfun('2', '$two');
        } else {
          setState(() {
            two = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock2': false});
          });
          check();
          queryfun('2', '$two');
        }
      }
    }
  }

  threeFun() {
    if (turn == true) {
      if (lock3 == true) {
        if (chance == true) {
          setState(() {
            three = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock3': false});
          });
          check();
          queryfun('3', '$three');
        } else {
          setState(() {
            three = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock3': false});
          });
          check();
          queryfun('3', '$three');
        }
      }
    }
  }

  fourFun() {
    if (turn == true) {
      if (lock4 == true) {
        if (chance == true) {
          setState(() {
            four = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock4': false});
          });
          check();
          queryfun('4', '$four');
        } else {
          setState(() {
            four = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock4': false});
          });
          check();
          queryfun('4', '$four');
        }
      }
    }
  }

  fiveFun() {
    if (turn == true) {
      if (lock5 == true) {
        if (chance == true) {
          setState(() {
            five = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock5': false});
          });
          check();
          queryfun('5', '$five');
        } else {
          setState(() {
            five = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock5': false});
          });
          check();
          queryfun('5', '$five');
        }
      }
    }
  }

  sixFun() {
    if (turn == true) {
      if (lock6 == true) {
        if (chance == true) {
          setState(() {
            six = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock6': false});
            check();
            queryfun('6', '$six');
          });
        } else {
          setState(() {
            six = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});

            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock6': false});
          });
          check();
          queryfun('6', '$six');
        }
      }
    }
  }

  sevenFun() {
    if (turn == true) {
      if (lock7 == true) {
        if (chance == true) {
          setState(() {
            seven = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock7': false});
            check();
            queryfun('7', '$seven');
          });
        } else {
          setState(() {
            seven = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock7': false});
          });
          check();
          queryfun('7', '$seven');
        }
      }
    }
  }

  eightFun() {
    if (turn == true) {
      if (lock8 == true) {
        if (chance == true) {
          setState(() {
            eight = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock8': false});
            check();
            queryfun('8', '$eight');
          });
        } else {
          setState(() {
            eight = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            ;
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock8': false});
          });
          check();
          queryfun('8', '$eight');
        }
      }
    }
  }

  nineFun() {
    if (turn == true) {
      if (lock9 == true) {
        if (chance == true) {
          setState(() {
            nine = 'O';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': false});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock9': false});
          });
          check();
          queryfun('9', '$nine');
        } else {
          setState(() {
            nine = 'X';
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'control': true});
            Firestore.instance
                .collection('rooms')
                .document('${widget.docid1}')
                .updateData({'lock9': false});
          });
          check();
          queryfun('9', '$nine');
        }
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
    getboardvalue();
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
        backgroundColor: Color.fromRGBO(112, 112, 112, 1),
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
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 5),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
                    color: Color.fromRGBO(112, 112, 112, 1),
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
}
