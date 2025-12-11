import 'package:ecommerce_app/models/note_model.dart';

abstract class NotesEvent {}

//add
class AddNote extends NotesEvent {
  final NoteModel noteModel;
  AddNote(this.noteModel);
}

//get
class GetNote extends NotesEvent {}

//update
class UpdateNote extends NotesEvent {
  final NoteModel noteModel;
  UpdateNote(this.noteModel);
}

//delete
class DeleteNote extends NotesEvent {
  final int noteID;
  DeleteNote(this.noteID);
}
