import 'package:ecommerce_app/blocs/notes/notes_event.dart';
import 'package:ecommerce_app/blocs/notes/notes_state.dart';
import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NoteInitial()) {
    on<AddNote>((event, emit) async {
      final data = await DBHelper.instance.insert(event.noteModel);
      if (data > 0) {
        final List<NoteModel> data = await DBHelper.instance.getAll();
        emit(LoadNotes(data));
      } else {
        emit(NoteError("Error"));
      }

      // emit(UpdateNoteSucess());
    });
    on<GetNote>((event, emit) async {
      final List<NoteModel> data = await DBHelper.instance.getAll();
      emit(LoadNotes(data));
    });
    on<UpdateNote>((event, emit) async {
      await DBHelper.instance.update(event.noteModel.id ?? 0, event.noteModel);
      emit(UpdateNoteSucess());
    });
    on<DeleteNote>((event, emit) async {
      await DBHelper.instance.delete(event.noteID);
      emit(UpdateNoteSucess());
    });
  }
}
// final data = await DBHelper.instance.getAll();