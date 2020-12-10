import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class TodoModel {
  TodoModel({this.id, this.complete = false, this.note, this.task});
  int id;
  bool complete;
  String note;
  String task;
}
