import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:s4smobile/routines_list.dart';

class RoutineUpload extends StatefulWidget {
  const RoutineUpload({Key? key}) : super(key: key);

  @override
  State<RoutineUpload> createState() => _RoutineUploadState();
}

class _RoutineUploadState extends State<RoutineUpload> {
  final LocalStorage storage = LocalStorage('s4s');
  final _formKey = GlobalKey<FormBuilderState>();
  bool _useCustomFileViewer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderFilePicker(
                    name: 'images',
                    decoration: const InputDecoration(labelText: 'Attachments'),
                    maxFiles: null,
                    allowMultiple: true,
                    previewImages: true,
                    onChanged: (val) => debugPrint(val.toString()),
                    selector: Row(
                      children: const <Widget>[
                        Icon(Icons.file_upload),
                        Text('Upload'),
                      ],
                    ),
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                    customFileViewerBuilder:
                        _useCustomFileViewer ? customFileViewerBuilder : null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          _formKey.currentState!.save();
                          debugPrint(_formKey.currentState!.value.toString());
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        child: Text(_useCustomFileViewer
                            ? 'Use Default File Viewer'
                            : 'Use Custom File Viewer'),
                        onPressed: () {
                          setState(() =>
                              _useCustomFileViewer = !_useCustomFileViewer);
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RoutinesList()));
                    },
                    child: const Text("Previous Routines"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customFileViewerBuilder(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> setter,
) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final file = files![index];
      return ListTile(
        title: Text(file.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            files.removeAt(index);
            setter.call([...files]);
          },
        ),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.blueAccent,
    ),
    itemCount: files!.length,
  );
}
