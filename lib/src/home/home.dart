import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import 'package:todo/src/home/view_model/home_view_model.dart';
import 'package:todo/src/home/widgets/add_todo_dialogue.dart';
import 'package:todo/src/home/widgets/todo_card.dart';
import 'package:todo/src/models/todo_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        actions: [
          Obx(
            () => SizedBox(
              child: controller.todos.any((element) => element.isComplete)
                  ? IconButton(
                      onPressed: () {
                        controller.deleteDoneTodos();
                      },
                      icon: Icon(Icons.delete),
                    )
                  : null,
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todoData = controller.todos[index];
            return TodoCard(
              todo: todoData,
              onToggle: () {
                // log("message");
                controller.toggleTodoStatus(index);
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data =
              await showDialog(
                    context: context,
                    builder: (context) => AddTodoDialogue(),
                  )
                  as List;

          if (data.isEmpty) {
            return;
          }

          final newTodo = TodoModel(
            title: data[0],
            description: data[1],
            isComplete: false,
          );

          controller.addTodo(newTodo);
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
