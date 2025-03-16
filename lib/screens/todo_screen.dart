import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('To-Do List'))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical:4,horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color:Colors.grey,
                        width: 2),
                  ),
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (_) => ref.read(todoProvider.notifier).toggleTodo(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter a task',
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(25),
                    // borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid)
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  ref.read(todoProvider.notifier).addTodo(_controller.text);
                  _controller.clear();
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}