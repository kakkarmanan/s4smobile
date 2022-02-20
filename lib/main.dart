import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:s4smobile/login1/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 's4s',
        theme: ThemeData(
          backgroundColor: const Color(0xffd5e4e1),
          colorScheme: const ColorScheme.light(),
        ),
        home: WelcomePage());
  }
}
