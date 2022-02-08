import 'package:flutter/material.dart';
import 'package:s4smobile/session_card.dart';
import 'package:s4smobile/model/session_model.dart';

class UpcomingSessionsDoc extends StatefulWidget {
  UpcomingSessionsDoc({Key? key}) : super(key: key);

  @override
  State<UpcomingSessionsDoc> createState() => _UpcomingSessionsDocState();
}

class _UpcomingSessionsDocState extends State<UpcomingSessionsDoc> {
  List sessions = [
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": Icon(Icons.upcoming_outlined),
    },
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": Icon(Icons.upcoming_outlined),
    },
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": Icon(Icons.upcoming_outlined),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, i) {
          Session new_session = new Session(
            title: sessions[i]['cardNumber'],
            date: '2 pm at 6/12/12',
            status: 'Pending',
          );
          return Column(
            children: [
              SizedBox(
                height: 1.0,
              ),
              SessionCard(
                  onTopRightButtonClicked: () => {}, cardIcon: Icon(Icons.add))
            ],
          );
        },
        scrollDirection: Axis.vertical,
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
