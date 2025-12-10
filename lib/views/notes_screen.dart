import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  List<Map<String, dynamic>> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,

              decoration: InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            TextFormField(
              controller: bodyController,
              decoration: InputDecoration(
                label: Text("Body"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // final notes = NoteModel(
                //   title: titleController.text,
                //   body: bodyController.text,
                // );
                final Map<String, dynamic> notes = {
                  'title': titleController.text,
                  'body': bodyController.text,
                };
                await DBHelper.instance.insert(notes);
              },
              child: Text("ADD"),
            ),

            ElevatedButton(
              onPressed: () async {
                final data = await DBHelper.instance.getAll();
                notes = data;
                print(data);
              },
              child: Text("GetData"),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final data = notes[index];
                  return ListTile(title: data['title'], subtitle: data['body']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
