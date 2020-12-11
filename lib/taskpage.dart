import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/bloc/todo_bloc.dart';

class Taskpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: Check(),
      ),
    );
  }
}

class Check extends StatelessWidget {
  Check({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.lists.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Center(child: Text(state.lists[index].note)),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<TodoBloc>(context).add(AddTodo()),
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
