import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/screens/counter_screen.dart';
import 'package:statemanagement_riverpod/screens/live_user_screen.dart';
import 'package:statemanagement_riverpod/screens/stock_screen.dart';
import 'package:statemanagement_riverpod/screens/todo_screen.dart';
import 'package:statemanagement_riverpod/screens/user_screen.dart';

void main() {
  runApp(ProviderScope(child : const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    CounterScreen(),
    TodoScreen(),
    UserScreen(),
    StockScreen(),
    LiveUserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.countertops), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Do'),
          BottomNavigationBarItem(icon: Icon(Icons.api), label: 'API'),
          BottomNavigationBarItem(icon: Icon(Icons.price_change_outlined), label: 'Stock'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
        onTap: _onItemTapped,
      ),
    );
  }
}

