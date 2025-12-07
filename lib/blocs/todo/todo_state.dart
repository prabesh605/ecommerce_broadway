abstract class TodoState {}

class TodoInitial extends TodoState {}

class LoadTodoSuccess extends TodoState {
  final List<String> todos;
  LoadTodoSuccess(this.todos);
}
