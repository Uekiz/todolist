part of 'main.dart';

class CheckTodo extends StatefulWidget {
  @override
  _CheckTodoState createState() => _CheckTodoState();
}

class _CheckTodoState extends State<CheckTodo> {
  final checkall = TodoModel(note: 'All');
  final chklists = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.lists.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: buildToggleCheckbox(checkall),
                      ),
                      Divider(),
                      ...state.lists.map(buildSingleCheckbox).toList(),
                      FloatingActionButton(
                        onPressed: () =>
                            BlocProvider.of<TodoBloc>(context).add(AddTodo()),
                        child: Icon(Icons.add),
                      )
                    ],
                  );
                });
          },
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
