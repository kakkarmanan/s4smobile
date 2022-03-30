import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  _renderBg() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 0.0, bottom: 10.0),
      color: const Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 13, 90, 65),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Upcoming Session',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  )),
              Text('Click to know date', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        back: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  )),
              Text('Click to flip', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 4,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 0.0, bottom: 10.0),
                  color: const Color(0x00000000),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 1000,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Total Sessions',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                              )),
                          Text('Click to See',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Sessions',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                              )),
                          Text('Click to flip',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 0.0, bottom: 10.0),
                  color: const Color(0x00000000),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 1000,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text('Upcoming Session',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                )),
                          ),
                          Text('Click to see date',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                              )),
                          Text('Click to flip',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 0.0, bottom: 10.0),
                  color: const Color(0x00000000),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 1000,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Previous Session',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                              )),
                          Text('Click to know date',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 13, 90, 65),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                              )),
                          Text('Click to flip',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
