part of 'todo_bloc.dart';

@immutable
class TodoState {
  TodoState({this.lists});

  List<TodoModel> lists = [
    TodoModel(note: '1'),
    TodoModel(note: '3'),
    TodoModel(note: '2'),
  ];
}
