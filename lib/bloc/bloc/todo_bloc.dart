import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolist/model/todomodel.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(lists: []));

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is LoadTodo) {
      yield TodoState(lists: await fetchlist());
    }
    if (event is AddTodo) {
      yield TodoState(lists: await addlist());
    }
  }

  Future<List> fetchlist() async {
    final resp = todosList;
    return resp;
  }

  Future<List> addlist() async {
    state.lists.add(TodoModel(note: 'asdasf'));
    return state.lists;
  }
}
