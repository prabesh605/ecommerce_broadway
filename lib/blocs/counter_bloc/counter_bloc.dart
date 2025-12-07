import 'package:ecommerce_app/blocs/counter_bloc/counter_event.dart';
import 'package:ecommerce_app/blocs/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) {
      final newValue = state.value + 1;
      emit(CounterSuccess(newValue));

      // if (newValue == 10) {
      //   emit(InternetProblem(0));
      // } else {
      //   emit(CounterSuccess(newValue));
      // }
    });
    on<Decrement>((event, emit) {
      final newValue = state.value - 1;
      emit(CounterSuccess(newValue));
    });
  }
}
