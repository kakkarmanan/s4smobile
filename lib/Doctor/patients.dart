import 'dart:convert';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:s4smobile/DoctorHome.dart';

class Patients extends StatefulWidget {
  Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  List<PatientListTile> list_patients = [];
  @override
  void initState() {
    super.initState();
    getPatients();
  }

  getPatients() async {
    var url = Uri.parse('https://shrink4shrink.herokuapp.com/api/get_patient');
    var response = await http.post(
      url,
      headers: <String, String>{
        'content-type': 'application/json',
        "Accept": "application/json",
        "charset": "utf-8"
      },
      body: json.encode({'email': storage.getItem('user')['email']}),
    );
    print(response.statusCode);
    var decodedData = jsonDecode(response.body);
    print('Decoded Data: $decodedData');
    for (int i = 0; i < decodedData.length; i++) {
      list_patients.add(PatientListTile(
        name: decodedData[i]['firstname'] + ' ' + decodedData[i]['lastname'],
        imgUrl: decodedData[i]['picture'],
      ));
    }
  }

  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: list_patients,
    ));
  }
}

class PatientListTile extends StatelessWidget {
  final String? name;
  final String? imgUrl;
  const PatientListTile({
    this.name,
    this.imgUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BannerListTile(
          showBanner: false,
          title: Text(
            '$name',
            style: TextStyle(color: Colors.white),
          ),
          imageContainer: Image(image: NetworkImage(imgUrl!)),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
