import 'package:flutter/material.dart';
import '../database/hive_db.dart';
import '../models/user_model.dart';
import 'add_edit_user.dart';
import 'user_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final users = HiveDB.box.values.toList().cast<UserModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),

      body: users.isEmpty
          ? const Center(child: Text('No users. Click + to add'))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(user.name),
            subtitle: Text(user.phone),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserDetail(
                    user: user,
                    index: index,
                  ),
                ),
              ).then((_) => setState(() {}));
            },

            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                HiveDB.box.deleteAt(index);
                setState(() {});
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditUser()),
          ).then((_) => setState(() {}));
        },
      ),
    );
  }
}
