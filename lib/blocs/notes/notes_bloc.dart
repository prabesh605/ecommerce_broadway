// import 'package:ecommerce_app/blocs/notes/notes_event.dart';
// import 'package:ecommerce_app/blocs/notes/notes_state.dart';
// import 'package:ecommerce_app/database/db.dart';
// import 'package:ecommerce_app/database/note_db_service.dart';
// import 'package:ecommerce_app/firebase/firestore_service.dart';
// import 'package:ecommerce_app/models/note_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NotesBloc extends Bloc<NotesEvent, NotesState> {
//   final NoteDbService service;
//   final FirestoreService firebaseService;
//   NotesBloc(this.service, this.firebaseService) : super(NoteInitial()) {
//     on<AddNote>((event, emit) async {
//       await firebaseService.addUser(event.noteModel);
//       // final data = await service.insert(event.noteModel);
//       // if (data > 0) {
//       //   final List<NoteModel> data = await service.getAll();
//       //   emit(LoadNotes(data));
//       // } else {
//       //   emit(NoteError("Error"));
//       // }

//       // emit(UpdateNoteSucess());
//     });
//     on<GetNote>((event, emit) async {
//       final Stream<List<NoteModel>>? data = await firebaseService.getNotess();
//       // final List<NoteModel> data = await service.getAll();
//       emit(StreamNotes(data));
//     });
//     // on<UpdateNote>((event, emit) async {
//     //   await service.update(event.noteModel.id ?? 0, event.noteModel);
//     //   emit(UpdateNoteSucess());
//     // });
//     on<DeleteNote>((event, emit) async {
//       await service.delete(event.noteID);
//       emit(UpdateNoteSucess());
//     });
//   }
// }
// // final data = await DBHelper.instance.getAll();