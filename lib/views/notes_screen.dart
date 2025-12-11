import 'package:ecommerce_app/blocs/notes/notes_bloc.dart';
import 'package:ecommerce_app/blocs/notes/notes_event.dart';
import 'package:ecommerce_app/blocs/notes/notes_state.dart';
import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  // List<NoteModel> notes = [];
  @override
  void initState() {
    context.read<NotesBloc>().add(GetNote());
    super.initState();
  }

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
                final notes = NoteModel(
                  title: titleController.text,
                  body: bodyController.text,
                );
                context.read<NotesBloc>().add(AddNote(notes));

                // await DBHelper.instance.insert(notes);
              },
              child: Text("ADD"),
            ),

            // ElevatedButton(
            //   onPressed: () async {
            //     final data = await DBHelper.instance.getAll();
            //     setState(() {
            //       notes = data;
            //     });

            //     print(data);
            //   },
            //   child: Text("GetData"),
            // ),
            BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                if (state is NoteLoading) {
                  return CircularProgressIndicator();
                }
                if (state is NoteError) {
                  return Text(state.message);
                }
                // if (state is UpdateNoteSucess) {
                //   return SizedBox(
                //     height: 200,
                //     child: ListView.builder(
                //       itemCount: state.length,
                //       itemBuilder: (context, index) {
                //         final data = notes[index];
                //         return ListTile(
                //           title: Text(data.title),
                //           subtitle: Text(data.body),
                //         );
                //       },
                //     ),
                //   );
                // }
                if (state is LoadNotes) {
                  return Expanded(
                    // height: 200,
                    child: ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        final data = state.list[index];
                        return ListTile(
                          title: Text(data.title),
                          subtitle: Text(data.body),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
