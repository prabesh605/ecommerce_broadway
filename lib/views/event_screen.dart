import 'package:ecommerce_app/blocs/event/event_bloc.dart';
import 'package:ecommerce_app/blocs/event/event_event.dart';
import 'package:ecommerce_app/blocs/event/event_state.dart';
import 'package:ecommerce_app/blocs/notes/notes_bloc.dart';
import 'package:ecommerce_app/blocs/notes/notes_event.dart';
import 'package:ecommerce_app/blocs/notes/notes_state.dart';
import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/firebase/firestore_service.dart';
import 'package:ecommerce_app/models/event_model.dart';
import 'package:ecommerce_app/models/note_model.dart';
import 'package:ecommerce_app/views/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  FirestoreService service = FirestoreService();
  // List<NoteModel> notes = [];
  @override
  void initState() {
    // context.read<NotesBloc>().add(GetNote());
    context.read<EventBloc>().add(GetStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event")),

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
                final event = EventModel(
                  title: titleController.text,
                  body: bodyController.text,
                  id: '${DateTime.now().millisecondsSinceEpoch}',
                );
                context.read<EventBloc>().add(AddEvent(event));
                titleController.clear();
                bodyController.clear();
                // service.addEvent(event);
                // context.read<NotesBloc>().add(AddNote(notes));
              },
              child: Text("ADD"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // service.getData();
            //     context.read<EventBloc>().add(GetEvent());
            //   },
            //   child: Text("Get Data"),
            // ),

            // Text("Simple Get"),
            // BlocBuilder<EventBloc, EventState>(
            //   builder: (context, state) {
            //     if (state is EventLoading) {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //     if (state is EventError) {
            //       return Center(child: Text(state.message));
            //     }
            //     if (state is LoadEvents) {
            //       final List<EventModel> eventList = state.list;
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: eventList.length,
            //           itemBuilder: (context, index) {
            //             final EventModel data = eventList[index];
            //             return ListTile(
            //               title: Text(data.title),
            //               subtitle: Text(data.body),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     return Container();
            //   },
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     // service.getData();
            //     context.read<EventBloc>().add(GetStream());
            //   },
            //   child: Text("Get Stream"),
            // ),
            Text("Stream Get"),
            BlocBuilder<EventBloc, EventState>(
              builder: (context, state) {
                if (state is EventLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is EventError) {
                  return Center(child: Text(state.message));
                }
                if (state is StreamEvents) {
                  return StreamBuilder(
                    stream: state.list,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            final event = data?[index];
                            return ListTile(
                              title: Text(event?.title ?? ""),
                              subtitle: Text(event?.body ?? ""),
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<EventBloc>().add(
                                    DeleteEvent(event?.id ?? ""),
                                  );
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
// return StreamBuilder(
//                     stream: state.list,
//                     builder: (context, snapShot) {
//                       final data = snapShot.data!;
//                       return Expanded(
//                         child: ListView.builder(
//                           itemCount: data.length,
//                           itemBuilder: (context, index) {
//                             final datas = data[index];
//                             return ListTile(
//                               title: Text(datas.title),
//                               subtitle: Text(datas.body),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   );