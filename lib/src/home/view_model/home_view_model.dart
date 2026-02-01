import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/src/models/todo_model.dart';

class HomeViewModel extends GetxController {
  var todos = <TodoModel>[
    TodoModel(title: "title", description: "description", isComplete: false),
  ].obs;
  final box = GetStorage();
  final String _key = "todoItems";
  void storeData() {
    box.write(_key, todos);
  }

  void getData() {
    final myTodos = box.read(_key);

    log(myTodos.toString());
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
    storeData();
    todos.refresh();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    todos.refresh();
  }

  void toggleTodoStatus(int index) {
    log(index.toString());
    todos[index].isComplete = !todos[index].isComplete;
    todos.refresh();
  }

  void deleteDoneTodos() {
    todos.removeWhere((element) => element.isComplete == true);
    todos.refresh();
  }

  void deleteByIndex(int index) {
    todos.removeAt(index);
    todos.refresh();
  }
}
