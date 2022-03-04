import 'package:flutter/material.dart';

class SessionDetails extends StatelessWidget {
  String user;
  String date;
  String time;
  String title;
  String doctor;
  SessionDetails({
    required this.user,
    required this.date,
    required this.time,
    required this.title,
    required this.doctor,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/img/Illustration.png'),
                ),
                Text(
                  "Date: " + date,
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Handlee"),
                ),
                Text(
                  "Time: " + time,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.teal[100],
                      fontWeight: FontWeight.bold,
                      fontFamily: "SourceSansPro",
                      letterSpacing: 2.0),
                ),
                SizedBox(
                  height: 10.0,
                  width: 200,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 1.0, end: 1.0),
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: const Icon(
                          Icons.flashlight_on_sharp,
                          color: Colors.teal,
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: const Icon(
                          Icons.email_rounded,
                          color: Colors.teal,
                        ),
                        title: Text(
                          user,
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 17,
                          ),
                        ),
                      )),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: const Icon(
                          Icons.medical_services_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          doctor,
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 17,
                          ),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Prescription");
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.document_scanner,
                            color: Colors.teal,
                          ),
                          title: Text(
                            "Prescription",
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: "SourceSansPro",
                              fontSize: 17,
                            ),
                          ),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Notes");
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.document_scanner,
                            color: Colors.teal,
                          ),
                          title: Text(
                            "Notes",
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: "SourceSansPro",
                              fontSize: 17,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
