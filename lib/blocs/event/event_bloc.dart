import 'package:ecommerce_app/blocs/event/event_event.dart';
import 'package:ecommerce_app/blocs/event/event_state.dart';
import 'package:ecommerce_app/firebase/firestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/event_model.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirestoreService firebaseService;
  EventBloc(this.firebaseService) : super(EventInitial()) {
    on<AddEvent>((event, emit) async {
      // emit(EventInitial());
      await firebaseService.addEvent(event.eventModel);
    });
    on<GetEvent>((event, emit) async {
      emit(EventLoading());
      final List<EventModel> data = await firebaseService.getData();
      emit(LoadEvents(data));
    });
    on<GetStream>((event, emit) async {
      emit(EventLoading());
      final Stream<List<EventModel>> data = firebaseService.getStream();
      emit(StreamEvents(data));
    });
    on<DeleteEvent>((event, emit) async {
      // emit(EventLoading());
      await firebaseService.deleteEvent(event.eventID);
    });
    on<UpdateEvent>((event, emit) async {
      await firebaseService.updateEvent(event.eventModel);
    });
  }
}
