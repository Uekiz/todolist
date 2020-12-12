part of 'todo_bloc.dart';

@immutable
class TodoState {
  TodoState({this.lists});

  List<TodoModel> lists = todosList;
}
