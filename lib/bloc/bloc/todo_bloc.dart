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
    if (event is AddTodo) {
      var list = _addlist();
      state.lists.add(list);
      yield TodoState();
    }
  }

  TodoModel _addlist() {
    return TodoModel(note: '123');
  }
}
