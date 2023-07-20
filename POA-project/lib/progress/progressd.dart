import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [];

  TextEditingController todoController = TextEditingController();

  void addTodo() {
    setState(() {
      todos.add(todoController.text);
      todoController.clear();
    });
  }

  void removeTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void editTodoAtIndex(int index) {
    todoController.text = todos[index];
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit Todo'),
              content: TextField(
                controller: todoController,
                decoration: InputDecoration(hintText: 'Enter a todo'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      todos[index] = todoController.text;
                      todoController.clear();
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    todoController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      hintText: 'Enter a todo',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: addTodo,
                  child: Text('add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeTodoAtIndex(index),
                  ),
                  onTap: () => editTodoAtIndex(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
