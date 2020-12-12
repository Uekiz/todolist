part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodo extends TodoEvent {}

class AddTodo extends TodoEvent {}
