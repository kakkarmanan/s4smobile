import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutinesList extends StatefulWidget {
  const RoutinesList({Key? key}) : super(key: key);

  @override
  _RoutinesListState createState() => _RoutinesListState();
}

class _RoutinesListState extends State<RoutinesList> {
  List routines = [];
  final LocalStorage storage = LocalStorage('s4s');
  Future<void> awaitReady() async {
    await storage.ready;
    print(storage.getItem("user")["email"]);
  }

  Future<void> loadData() async {
    var url = Uri.parse("https://shrink4shrink.herokuapp.com/api/get_routine");
    var response = await http.post(url,
        headers: <String, String>{
          'content-type': 'application/json',
          "Accept": "application/json",
          "charset": "utf-8"
        },
        body: json.encode({
          'email': storage.getItem("user")["email"],
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        routines = data;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No routines found')));
    }
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
      appBar: AppBar(
        title: const Text("Previous Routines"),
      ),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.check_box_rounded),
                  title: const Text('Routine'),
                  subtitle: Text(routines[i]["date"]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('View Routine'),
                      onPressed: () {
                        print(routines[i]["link"]);
                        Uri.parse(routines[i]["link"]);
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          );
        },
        scrollDirection: Axis.vertical,
        //physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
