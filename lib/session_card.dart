import 'package:flutter/material.dart';

class SessionCard extends StatefulWidget {
  SessionCard({Key? key}) : super(key: key);

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.all(7.0),
          width: 500,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Text('Heading'),
            ],
          ),
        ),
      ),
    );
  }
}
