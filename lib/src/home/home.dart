import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import 'package:todo/src/home/view_model/home_view_model.dart';
import 'package:todo/src/home/widgets/add_todo_dialogue.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todoData = controller.todos[index];
            return ListTile(title: Text(todoData.title));
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddTodoDialogue());
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
