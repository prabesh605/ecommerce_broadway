abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
}

class RemoveTodo extends TodoEvent {
  final int index;
  RemoveTodo(this.index);
}

//addTodo
//removeTodo
