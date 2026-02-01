import 'package:flutter/material.dart';

class AddTodoDialogue extends StatelessWidget {
  AddTodoDialogue({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 500,

          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text("Enter title"),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text("Enter title"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
