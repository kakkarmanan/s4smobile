import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewSession extends StatefulWidget {
  const NewSession({Key? key}) : super(key: key);

  @override
  _NewSessionState createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  final LocalStorage storage = LocalStorage('s4s');
  TextEditingController titleController = TextEditingController();
  String date = "";
  String time = "";
  Future<void> createSession() async {
    var url = Uri.parse("https://shrink4shrink.herokuapp.com/api/new_session");
    var response = await http.post(url,
        headers: <String, String>{
          'content-type': 'application/json',
          "Accept": "application/json",
          "charset": "utf-8"
        },
        body: json.encode({
          'email': storage.getItem("user")["email"],
          'title': titleController.text.toString(),
          'date': date,
          'time': time,
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        date = "";
        time = "";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error in creating session')));
    }
  }

  void set(DateTime value) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Session"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title of Appointment',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
            child: Container(
              width: size.width,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: DateTimeFormField(
                decoration: InputDecoration(
                    hintText: "Departure Time",
                    errorStyle: const TextStyle(color: Colors.redAccent),
                    suffixIcon:
                        const Icon(Icons.event_note, color: Colors.blueAccent),
                    labelText: 'Departure Time',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    date = value
                        .toString()
                        .substring(0, value.toString().indexOf(' '));
                    time = value.toString().substring(
                        value.toString().indexOf(' ') + 1,
                        value.toString().lastIndexOf(':'));
                  });
                  print(value
                      .toString()
                      .substring(0, value.toString().indexOf(' ')));
                  print(value.toString().substring(
                      value.toString().indexOf(' ') + 1,
                      value.toString().lastIndexOf(':')));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                createSession();
              },
              child: const Text('Request Session'),
            ),
          ),
        ],
      ),
    );
  }
}
