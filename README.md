# Flutter Riverpod State Management - Quick Reference

This Flutter project demonstrates different Riverpod state management techniques using separate pages. You can navigate between them using a Bottom Navigation Bar.

## Features
- StateProvider - Counter Example <br>
- StateNotifierProvider - To-Do List <br>
- ChangeNotifierProvider - User Profile <br>
- FutureProvider - Stock Market Data <br>
- StreamProvider - Live User Updates <br>

<i>Each provider is implemented in a separate screen, and navigation is handled with a BottomNavigationBar.</i>

## Project Structure

/lib <br>
│── main.dart <br>
│── screens/ <br>
│   │── counter_screen.dart          # StateProvider Example <br>
│   │── todo_screen.dart             # StateNotifierProvider Example <br>
│   │── user_screen.dart             # ChangeNotifierProvider Example <br>
│   │── stock_screen.dart            # FutureProvider Example <br>
│   │── live_user_screen.dart        # StreamProvider Example <br>
│── providers/ <br>
│   │── counter_provider.dart <br>
│   │── todo_provider.dart <br>
│   │── user_provider.dart <br>
│   │── stock_provider.dart <br>
│   │── live_user_provider.dart <br>

# Riverpod Providers Explaination

## StateProvider - Counter Example
- Use Case: Managing simple primitive state (e.g., int, bool).
- File: counter_screen.dart
```
final counterProvider = StateProvider<int>((ref) => 0);

class CounterScreen extends ConsumerWidget {
@override
Widget build(BuildContext context, WidgetRef ref) {
  final counter = ref.watch(counterProvider);
    return Scaffold(
      body:Column(
        children: [
          Text('Counter: $counter'),
          ElevatedButton(
            onPressed: () => ref.read(counterProvider.notifier).state++,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
```
<br><br>
## StateNotifierProvider - To-Do List
- Use Case: Managing complex state (lists, objects).
- File: todo_screen.dart

```
class TodoNotifier extends StateNotifier<List<String>> {
  TodoNotifier() : super([]);

  void addTask(String task) {
    state = [...state, task];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<String>>((ref) => TodoNotifier());
```
<br><br>
## ChangeNotifierProvider - User Profile
- Use Case: Managing state using ChangeNotifier.
- File: user_screen.dart

```
class User extends ChangeNotifier {
  String name = "Guest";

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider((ref) => User());
```
<br><br>
## FutureProvider - Stock Data
- Use Case: Fetching data asynchronously (API calls, database).
- File: stock_screen.dart

```
final stockProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return ['AAPL', 'GOOG', 'MSFT'];
});
```
<br><br>
##  StreamProvider - Live User Updates
- Use Case: Real-time data updates (Firebase, WebSockets).
- File: live_user_screen.dart

```
final userStreamProvider = StreamProvider<String>((ref) {
  return Stream.periodic(Duration(seconds: 1), (count) => 'User $count');
});

```
<br><br>
## Summary
| Provider Type          | Purpose                         | Example Screen    |
|------------------------|--------------------------------|-------------------|
| `StateProvider`       | Simple state (int, bool)      | Counter Screen    |
| `StateNotifierProvider` | Complex state (lists, objects) | To-Do Screen      |
| `ChangeNotifierProvider` | Object-based state management | User Screen       |
| `FutureProvider`      | API calls / async data        | Stock Screen      |
| `StreamProvider`      | Real-time updates             | Live User Screen  |
