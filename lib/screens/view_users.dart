import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({super.key});

  @override
  State<ViewUsers> createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Load users when screen opens
  }

  void fetchUsers() async {
    final data = await DbHelper.getUsers();
    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: users.isEmpty
          ? const Center(child: Text('No users found'))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(user['firstName']),
              subtitle: Text(
                  '${user['gender']} | ${user['phone']} | ${user['state']}, ${user['city']}'),
            ),
          );
        },
      ),
    );
  }
}
