import 'package:flutter/material.dart';
import 'package:s4smobile/model/session_model.dart';
import 'package:s4smobile/session_card.dart';

class PendingSessionsDoc extends StatefulWidget {
  const PendingSessionsDoc({Key? key}) : super(key: key);

  @override
  State<PendingSessionsDoc> createState() => _PendingSessionsDocState();
}

class _PendingSessionsDocState extends State<PendingSessionsDoc> {
  List sessions = [
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": const Icon(Icons.upcoming_outlined),
    },
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": const Icon(Icons.upcoming_outlined),
    },
    {
      "cardNumber": 'Session heading',
      "balance": '2222',
      "onTopRightButtonClicked": () => {},
      "cardIcon": const Icon(Icons.upcoming_outlined),
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
