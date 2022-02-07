import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class RoutineUpload extends StatefulWidget {
  const RoutineUpload({Key? key}) : super(key: key);

  @override
  State<RoutineUpload> createState() => _RoutineUploadState();
}

class _RoutineUploadState extends State<RoutineUpload> {
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
                ],
              ),
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.check_box_rounded),
                  title: Text('Date of Routine'),
                  subtitle: Text('Timestamp of Upload'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('View Routine'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
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
