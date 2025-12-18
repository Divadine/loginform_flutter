import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'add_edit_user.dart';

class UserDetail extends StatelessWidget {
  final UserModel user;
  final int index;

  const UserDetail({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Phone: ${user.phone}'),
            Text('Gender: ${user.gender}'),
            Text('Agree: ${user.agree}'),
            Text('Accept: ${user.accept}'),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Edit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AddEditUser(user: user, index: index),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
