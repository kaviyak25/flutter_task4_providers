import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/todo.dart';

class TodoService {
  Future<List<Todo>?> getAll() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return todoFromJson(json);
    } else {
      throw Exception('Something went wrong,Try again!');
    }
  }
}
