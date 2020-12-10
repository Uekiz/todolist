part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodo extends TodoEvent {}
