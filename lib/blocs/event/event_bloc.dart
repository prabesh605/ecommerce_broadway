import 'package:ecommerce_app/blocs/Event/Event_event.dart';
import 'package:ecommerce_app/blocs/Event/Event_state.dart';

import 'package:ecommerce_app/database/note_db_service.dart';
import 'package:ecommerce_app/firebase/firestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/event_model.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirestoreService firebaseService;
  EventBloc(this.firebaseService) : super(EventInitial()) {
    on<AddEvent>((event, emit) async {
      emit(EventInitial());
      await firebaseService.addEvent(event.eventModel);
    });
    on<GetEvent>((event, emit) async {
      emit(EventInitial());
      final List<EventModel> data = await firebaseService.getData();
      emit(LoadEvents(data));
    });
  }
}
