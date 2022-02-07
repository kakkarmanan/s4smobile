import 'package:flutter/material.dart';

class PreviousSessions extends StatefulWidget {
  PreviousSessions({Key? key}) : super(key: key);

  @override
  State<PreviousSessions> createState() => _PreviousSessionsState();
}

class _PreviousSessionsState extends State<PreviousSessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Previous page'),
      ),
    );
  }
}
