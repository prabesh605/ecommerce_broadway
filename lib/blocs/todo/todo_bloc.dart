import 'package:ecommerce_app/blocs/todo/todo_event.dart';
import 'package:ecommerce_app/blocs/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
//if addTodo click
//--process
// -- state send
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    List<String> list = [];
    //--add event -> loadsuccess
    on<AddTodo>((event, emit) {
      list.add(event.task);
      emit(LoadTodoSuccess(list));
    });
    //--remove event ->loadSuccess
    on<RemoveTodo>((event, emit) {
      list.removeAt(event.index);
      emit(LoadTodoSuccess(list));
    });
  }
}
