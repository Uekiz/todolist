part of 'todo_bloc.dart';

@immutable
class TodoState {
  TodoState({this.lists});

  final List<TodoModel> lists;
}
