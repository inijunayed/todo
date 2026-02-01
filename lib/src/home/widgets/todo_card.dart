import 'package:flutter/material.dart';
import 'package:todo/src/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo, this.onToggle});
  final TodoModel todo;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: todo.isComplete ? Colors.grey : Colors.green,
                    fontWeight: FontWeight.bold,
                    decoration: todo.isComplete
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  todo.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    decoration: todo.isComplete
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: todo.isComplete ? null : onToggle,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                todo.isComplete
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
