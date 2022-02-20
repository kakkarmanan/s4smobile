import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:login/screens/fadeanimation.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_field/date_field.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:s4smobile/form.dart';
import 'package:http/http.dart' as http;

class DoctorSignupPage extends StatefulWidget {
  @override
  State<DoctorSignupPage> createState() => _DoctorSignupPageState();
}

class _DoctorSignupPageState extends State<DoctorSignupPage> {
  String? _fileName;
  String licenseUrl = "";

  String state = "";

  String gender = "";

  DateTime date = DateTime.now();

  File? file;

  TextEditingController fisrtNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController yearsofExpController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController licenseController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  uploadImage(File? file) async {
    var ref = FirebaseStorage.instance.ref().child('posts/$_fileName');
    await ref.putFile(file!).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        setState(() {
          licenseUrl = value;
          print(licenseUrl);
        });
      });
    });
  }

  getFileUrl() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      uploadImage(file);
    } else {
      // User canceled the picker
    }
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
    },
    {
      'value': 'Female',
      'label': 'Female',
    },
    {
      'value': 'Prefferably Not Say',
      'label': 'Prefferably Not Say',
    },
  ];

  onSumit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    makeInput(
                        label: "First Name", controller: fisrtNameController),
                    makeInput(
                        label: "Last Name", controller: lastNameController),
                    makeInput(
                        label: "License Number", controller: licenseController),
                    makeInput(
                        label: "Years of Experience",
                        controller: yearsofExpController),
                    Container(
                      child: TextButton(
                        onPressed: getFileUrl,
                        child: const Text('Upload Document'),
                      ),
                    ),
                    makeInput(label: "Upload Document"),
                    makeInput(
                        label: "Contact Number (with country code)",
                        controller: numberController),
                    makeInput(label: "Address", controller: addressController),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      initialValue: 'circle',
                      labelText: 'Gender',
                      items: _items,
                      onChanged: (val) {
                        setState(() {
                          gender = val;
                        });
                      },
                      onSaved: (val) => print(val),
                    ),
                    DropdownSearch<String>(
                      mode: Mode.MENU,
                      //showSelectedItem: true,
                      items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                      label: "State",
                      hint: "country in menu mode",
                      onChanged: (val) {
                        setState(() {
                          state = val!;
                        });
                      },
                      selectedItem: state,
                    ),
                    makeInput(label: "City", controller: cityController),
                    makeInput(label: "Pincode", controller: pincodeController),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DateTimeFormField(
                        decoration: InputDecoration(
                            hintText: "DOB",
                            errorStyle:
                                const TextStyle(color: Colors.redAccent),
                            suffixIcon: const Icon(Icons.event_note,
                                color: Colors.blueAccent),
                            labelText: 'DOB',
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.75)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 20.0),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                          setState(() {
                            date = value;
                          });
                        },
                      ),
                    ),
                    makeInput(label: "Email", controller: emailController),
                    makeInput(
                        label: "Password",
                        obscureText: true,
                        controller: passwordController),
                    makeInput(
                        label: "Confirm Password",
                        obscureText: true,
                        controller: confirmPasswordController),
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        // onPressed: () => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => Typeform())),
                        onPressed: () {},
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text("Already have an account?"),
                        Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
