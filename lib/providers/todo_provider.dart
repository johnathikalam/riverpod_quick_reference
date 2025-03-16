import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state
class Todo {
  final String title;
  final bool isCompleted;
  Todo(this.title, {this.isCompleted = false});
}

// Define the StateNotifier
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    state = [...state, Todo(title)];
  }

  void toggleTodo(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Todo(state[i].title, isCompleted: !state[i].isCompleted)
        else
          state[i]
    ];
  }
}

// Define the provider
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());
