import 'package:flutter/material.dart';

class RoutineUpload extends StatefulWidget {
  RoutineUpload({Key? key}) : super(key: key);

  @override
  State<RoutineUpload> createState() => _RoutineUploadState();
}

class _RoutineUploadState extends State<RoutineUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Routine'),
      ),
    );
    ;
  }
}
