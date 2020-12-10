import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/bloc/todo_bloc.dart';
import 'package:todolist/model/todomodel.dart';

class CheckTodo extends StatefulWidget {
  @override
  _CheckTodoState createState() => _CheckTodoState();
}

class _CheckTodoState extends State<CheckTodo> {
  final lists = [
    TodoModel(note: '1'),
    TodoModel(note: '3'),
    TodoModel(note: '2'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Divider(),
            ...lists.map(buildSingleCheckbox).toList(),
          ],
        ),
      );

  Widget buildSingleCheckbox(TodoModel lists) => buildCheckbox(
        lists: lists,
        onClicked: () {
          setState(() {
            lists.complete = !lists.complete;
          });
        },
      );

  Widget buildCheckbox({
    @required TodoModel lists,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: lists.complete,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          lists.note,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
