import 'package:ecommerce_app/models/note_model.dart';

abstract class NotesState {}

class NoteInitial extends NotesState {}

class NoteLoading extends NotesState {}

class NoteError extends NotesState {
  final String message;

  NoteError(this.message);
}

class LoadNotes extends NotesState {
  final List<NoteModel> list;
  LoadNotes(this.list);
}

class UpdateNoteSucess extends NotesState {}
