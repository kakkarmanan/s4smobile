import 'package:flutter/material.dart';
import 'package:s4smobile/form/start_form.dart';
//import 'package:login/screens/fadeanimation.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';

class UserSignupPage extends StatefulWidget {
  @override
  State<UserSignupPage> createState() => _UserSignupPageState();
}

class _UserSignupPageState extends State<UserSignupPage> {
  String label = "";
  String state = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  onSubmit() {
    print('submit');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => IntroScreen()));
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      //'icon': const Icon(Icons.boy),
    },
    {
      'value': 'Female',
      'label': 'Female',
      //'icon': const Icon(Icons.girl),
    },
    {
      'value': 'Prefferably Not Say',
      'label': 'Prefferably Not Say',
      //'icon': const Icon(Icons.grade),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
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
                        label: "First Name", controller: firstNameController),
                    makeInput(
                        label: "Last Name", controller: lastNameController),
                    makeInput(label: "Email", controller: emailController),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      initialValue: 'circle',
                      labelText: 'Gender',
                      items: _items,
                      onChanged: (val) {
                        setState(() {
                          label = val;
                        });
                      },
                      onSaved: (val) => print(val),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    makeInput(label: "Address", controller: addressController),
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
                    const SizedBox(
                      height: 10,
                    ),
                    makeInput(label: "City", controller: cityController),
                    makeInput(label: "Pincode", controller: pincodeController),
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
                        onPressed: onSubmit,
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
