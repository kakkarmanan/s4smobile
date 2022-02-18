import 'package:flutter/material.dart';

import 'package:s4smobile/login1/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 's4s',
        theme: ThemeData(
          backgroundColor: Color(0xffd5e4e1),
          colorScheme: ColorScheme.light(),
        ),
        home: WelcomePage());
  }
}
