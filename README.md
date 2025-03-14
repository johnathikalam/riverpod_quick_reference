# Flutter Riverpod State Management - Quick Reference

This Flutter project demonstrates different Riverpod state management techniques using separate pages. You can navigate between them using a Bottom Navigation Bar.

## Features
~ StateProvider - Counter Example\n
~ StateNotifierProvider - To-Do List
~ ChangeNotifierProvider - User Profile
~ FutureProvider - Stock Market Data
~ StreamProvider - Live User Updates

Each provider is implemented in a separate screen, and navigation is handled with a BottomNavigationBar.

## Project Structure

/lib
│── main.dart
│── screens/
│   │── counter_screen.dart          # StateProvider Example
│   │── todo_screen.dart             # StateNotifierProvider Example
│   │── user_screen.dart             # ChangeNotifierProvider Example
│   │── stock_screen.dart            # FutureProvider Example
│   │── live_user_screen.dart        # StreamProvider Example
│── providers/
│   │── counter_provider.dart
│   │── todo_provider.dart
│   │── user_provider.dart
│   │── stock_provider.dart
│   │── live_user_provider.dart

