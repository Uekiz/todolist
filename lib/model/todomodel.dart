import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class TodoModel {
  TodoModel(
      {this.id, this.complete = false, this.note, this.task, TodoModel list});
  int id;
  bool complete;
  String note;
  String task;
}

List<TodoModel> todosList = <TodoModel>[
  TodoModel(note: ' Jesus '),
  TodoModel(note: ' Christ '),
];
