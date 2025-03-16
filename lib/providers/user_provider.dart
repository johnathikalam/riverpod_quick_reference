import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating network delay
  return [
    User(id: 12, name: 'Alice', email: 'alice@gmail.com'),
    User(id: 14, name: 'Bob', email: 'bob@gmail.com'),
    User(id: 15, name: 'Charlie', email: 'charlie@gmail.com'),
  ];
});


// FutureProvider to fetch users
// final userProvider = FutureProvider<List<User>>((ref) async {
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = jsonDecode(response.body);
//     return data.map((json) => User.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
// });