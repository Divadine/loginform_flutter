import 'package:flutter/material.dart';
import 'user_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UserDetailScreen()),
            );
          },
          child: const Text('Go to Users'),
        ),
      ),
    );
  }
}
