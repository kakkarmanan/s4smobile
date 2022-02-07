import 'package:flutter/material.dart';
import 'package:s4smobile/model/session_model.dart';
import 'package:s4smobile/session_card.dart';

class PreviousSessions extends StatefulWidget {
  PreviousSessions({Key? key}) : super(key: key);

  @override
  State<PreviousSessions> createState() => _PreviousSessionsState();
}

class _PreviousSessionsState extends State<PreviousSessions> {
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
