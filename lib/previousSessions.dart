import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:s4smobile/session_details.dart';

class PreviousSessions extends StatefulWidget {
  PreviousSessions({Key? key}) : super(key: key);

  @override
  State<PreviousSessions> createState() => _PreviousSessionsState();
}

class _PreviousSessionsState extends State<PreviousSessions> {
  final LocalStorage storage = LocalStorage('s4s');
  List sessions = [];
  Future<void> loadData() async {
    var url = Uri.parse("https://shrink4shrink.herokuapp.com/api/usersessions");
    var response = await http.post(url,
        headers: <String, String>{
          'content-type': 'application/json',
          "Accept": "application/json",
          "charset": "utf-8"
        },
        body: json.encode({
          'email': storage.getItem("user")["email"],
          'upcoming': "false",
          'doctor': "false",
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        sessions = data;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No sessions found')));
    }
  }

  void detailsPage(
      String user, String date, String time, String title, String doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SessionDetails(
                  user: user,
                  date: date,
                  time: time,
                  title: title,
                  doctor: doctor,
                )));
  }

  Future<void> awaitReady() async {
    await storage.ready;
    print(storage.getItem("user")["email"]);
  }

  @override
  void initState() {
    awaitReady();
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, i) {
          return Card(
            child: Container(
              height: 100,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: ListTile(
                              title: Text(
                                sessions[i]["title"],
                              ),
                              subtitle: Text(
                                sessions[i]["date"],
                              ),
                              trailing: Text(
                                sessions[i]["time"],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  child: const Text("See Details"),
                                  onPressed: () {
                                    detailsPage(
                                      sessions[i]["user"],
                                      sessions[i]["date"],
                                      sessions[i]["time"],
                                      sessions[i]["title"],
                                      sessions[i]["doctor"],
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 8,
                  ),
                ],
              ),
            ),
            elevation: 8,
            margin: const EdgeInsets.all(10),
          );
        },
        scrollDirection: Axis.vertical,
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
