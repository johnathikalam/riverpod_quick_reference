import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_provider.dart';

class LiveUserScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: users.when(
        data: (userList) => ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical:4,horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                    color:Colors.grey,
                    width: 2),
              ),
              child: ListTile(
                leading: CircleAvatar(child: Text(user.id.toString())),
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}