import 'package:flutter/material.dart';

class UpcomingSessions extends StatefulWidget {
  UpcomingSessions({Key? key}) : super(key: key);

  @override
  State<UpcomingSessions> createState() => _UpcomingSessionsState();
}

class _UpcomingSessionsState extends State<UpcomingSessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Upcoming Sessionss'),
      ),
    );
  }
}
