import 'package:flutter/material.dart';
import 'package:flutter_task4_providers/api_provider/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('PROVIDER API'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = value.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text(
                    todo.id.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: todo.completed ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: todo.completed ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
