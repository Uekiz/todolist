import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/bloc/todo_bloc.dart';
import 'package:todolist/model/todomodel.dart';

class CheckTodo extends StatefulWidget {
  @override
  _CheckTodoState createState() => _CheckTodoState();
}

class _CheckTodoState extends State<CheckTodo> {
  final checkall = TodoModel(note: 'All');
  final chklists = [
    TodoModel(note: '1'),
    TodoModel(note: '3'),
    TodoModel(note: '2'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            buildToggleCheckbox(checkall),
            Divider(),
            ...chklists.map(buildSingleCheckbox).toList(),
          ],
        ),
      );

  Widget buildSingleCheckbox(TodoModel chklist) => buildCheckbox(
        chklist: chklist,
        onClicked: () {
          setState(() {
            final newValue = !chklist.complete;
            chklist.complete = newValue;

            if (!newValue) {
              checkall.complete = false;
            } else {
              final allow = chklists.every((chklist) => chklist.complete);
              checkall.complete = allow;
            }
          });
        },
      );

  Widget buildToggleCheckbox(TodoModel chklist) => buildCheckbox(
      chklist: chklist,
      onClicked: () {
        final newValue = !chklist.complete;

        setState(() {
          checkall.complete = newValue;
          chklists.forEach((chklists) {
            chklists.complete = newValue;
          });
        });
      });

  Widget buildCheckbox({
    @required TodoModel chklist,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: chklist.complete,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          chklist.note,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
