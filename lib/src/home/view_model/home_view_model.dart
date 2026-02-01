import 'package:get/get.dart';
import 'package:todo/src/models/todo_model.dart';

class HomeViewModel extends GetxController {
  var todos = <TodoModel>[
    TodoModel(title: "title", description: "description", isComplete: false),
  ].obs;

  void addTodo(TodoModel todo) {
    todos.add(todo);
    todos.refresh();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    todos.refresh();
  }

  void toggleTodoStatus(int index) {
    todos[index].isComplete = !todos[index].isComplete;
    todos.refresh();
  }
}
