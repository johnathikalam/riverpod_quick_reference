# Flutter Riverpod State Management - Quick Reference

This Flutter project demonstrates different Riverpod state management techniques using separate pages. You can navigate between them using a Bottom Navigation Bar.

## Features
~ StateProvider - Counter Example <br>
~ StateNotifierProvider - To-Do List <br>
~ ChangeNotifierProvider - User Profile <br>
~ FutureProvider - Stock Market Data <br>
~ StreamProvider - Live User Updates <br>

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
'''
- final counterProvider = StateProvider<int>((ref) => 0);

class CounterScreen extends ConsumerWidget {
@override
Widget build(BuildContext context, WidgetRef ref) {
final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
}
}

'''