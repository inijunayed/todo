import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/src/home/widgets/custom_button.dart';
import 'package:todo/src/home/widgets/custom_text_field.dart';

class AddTodoDialogue extends StatelessWidget {
  AddTodoDialogue({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 350,

            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: titleController,
                  hint: Text("e g. Practice Flutter"),
                  label: Text("Title"),
                  prefixIcon: Icon(Icons.title),
                  validator: (value) {
                    // log("here");
                    if (value == null || value.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  height: 150,
                  controller: descController,
                  hint: Text("Some description about the todo...."),
                  label: Text("Description"),
                  prefixIcon: Icon(Icons.description),

                  validator: (value) {
                    log("here");
                    if (value == null || value.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        // Add todo logic
                        Navigator.pop(context);
                      },
                    ),
                    CustomButton(
                      child: Row(
                        children: [
                          Icon(Icons.save, color: Colors.white),
                          SizedBox(width: 8),

                          Text(
                            "Add Todo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        // Add todo logic

                        if (_key.currentState!.validate()) {
                          Navigator.of(
                            context,
                          ).pop([titleController.text, descController.text]);
                        }

                        // log(_key.currentState!.validate().toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
