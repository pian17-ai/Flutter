import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<TodoItem> _todoList = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isEmpty) return;
    setState(() {
      _todoList.add(TodoItem(task: task));
    });
    _textController.clear();
  }

  void _toggleTodoItem(int index) {
    setState(() {
      _todoList[index].isDone = !_todoList[index].isDone;
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  Widget _buildTodoItem(TodoItem item, int index) {
    return ListTile(
      title: Text(
        item.task,
        style: TextStyle(
          decoration: item.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: item.isDone,
        onChanged: (_) => _toggleTodoItem(index),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => _removeTodoItem(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Add new task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _addTodoItem,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTodoItem(_textController.text),
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _todoList.isEmpty
                ? Center(child: Text('No tasks yet!'))
                : ListView.builder(
                    itemCount: _todoList.length,
                    itemBuilder: (context, index) {
                      return _buildTodoItem(_todoList[index], index);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String task;
  bool isDone;

  TodoItem({required this.task, this.isDone = false});
}
