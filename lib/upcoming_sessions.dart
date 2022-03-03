import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UpcomingSessions extends StatefulWidget {
  UpcomingSessions({Key? key}) : super(key: key);

  @override
  State<UpcomingSessions> createState() => _UpcomingSessionsState();
}

class _UpcomingSessionsState extends State<UpcomingSessions> {
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
          'upcoming': "true",
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
                                sessions?[i]["title"],
                              ),
                              subtitle: Text(
                                sessions?[i]["date"],
                              ),
                              trailing: Text(
                                sessions?[i]["time"],
                              ),
                            ),
                          ),
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
