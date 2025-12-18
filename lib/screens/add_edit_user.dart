import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';

class AddEditUser extends StatefulWidget {
  final UserModel? user;
  final int? index;
  const AddEditUser({Key? key, this.user, this.index}) : super(key: key);

  @override
  State<AddEditUser> createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController passwordCtrl;
  String? gender;
  bool agree = false;
  bool accept = false;

  final Box<UserModel> userBox = Hive.box<UserModel>('users');
  final RegExp passwordRegex =
  RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.user?.name ?? '');
    passwordCtrl = TextEditingController(text: widget.user?.password ?? '');
    gender = widget.user?.gender;
    agree = widget.user?.agree ?? false;
    accept = widget.user?.accept ?? false;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void saveUser() {
    if (_formKey.currentState!.validate() &&
        gender != null &&
        agree &&
        accept) {
      final user = UserModel(
        name: nameCtrl.text,
        password: passwordCtrl.text,
        gender: gender!,
        agree: agree,
        accept: accept,
      );

      if (widget.user != null && widget.index != null) {
        userBox.putAt(widget.index!, user);
      } else {
        userBox.add(user);
      }

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text(widget.user == null ? 'Add User' : 'Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  if (value.length < 3) return 'Minimum 3 chars';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (_) => _formKey.currentState?.validate(),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password required';
                  if (!passwordRegex.hasMatch(value))
                    return 'Min 8 chars, 1 caps, 1 number, 1 special char';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,
                onChanged: (value) => setState(() => gender = value),
              ),
              RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,
                onChanged: (value) => setState(() => gender = value),
              ),
              if (gender == null)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('Please select gender', style: TextStyle(color: Colors.red)),
                ),
              CheckboxListTile(
                title: const Text('I Agree'),
                value: agree,
                onChanged: (v) => setState(() => agree = v ?? false),
              ),
              CheckboxListTile(
                title: const Text('I Accept Terms'),
                value: accept,
                onChanged: (v) => setState(() => accept = v ?? false),
              ),
              if (!agree || !accept)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('You must agree and accept', style: TextStyle(color: Colors.red)),
                ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: saveUser,
                child: Text(widget.user == null ? 'Save' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
