import 'package:flutter/material.dart';
import '../database/hive_db.dart';
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
  late TextEditingController phoneCtrl;
  late TextEditingController passwordCtrl;

  String gender = 'Male';
  bool agree = false;
  bool accept = false;

  @override
  void initState() {
    super.initState();

    nameCtrl = TextEditingController(text: widget.user?.name ?? '');
    phoneCtrl = TextEditingController(text: widget.user?.phone ?? '');
    passwordCtrl = TextEditingController(text: widget.user?.password ?? '');

    gender = widget.user?.gender ?? 'Male';
    agree = widget.user?.agree ?? false;
    accept = widget.user?.accept ?? false;
  }

  void saveUser() {
    if (!_formKey.currentState!.validate()) return;

    final user = UserModel(
      name: nameCtrl.text,
      phone: phoneCtrl.text,
      gender: gender,
      password: passwordCtrl.text,
      agree: agree,
      accept: accept,
    );

    if (widget.index == null) {
      HiveDB.box.add(user);
    } else {
      HiveDB.box.putAt(widget.index!, user);
    }

    Navigator.pop(context);
  }

  // void saveUser() async {
  //   // 🔴 Basic validation
  //   if (nameController.text.length < 3) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('Name must be at least 3 letters')));
  //     return;
  //   }
  //
  //   // 1️⃣ Get Hive box
  //   final box = Hive.box<UserModel>('users');
  //
  //   // 2️⃣ Create user object
  //   final user = UserModel(
  //     name: nameController.text,
  //     phone: phoneController.text,
  //     password: passwordController.text,
  //     gender: selectedGender,
  //     agree: agree,
  //     accept: accept,
  //   );
  //
  //   // 3️⃣ Save to database
  //   await box.add(user);
  //
  //   // 4️⃣ DEBUG – check saved data
  //   print('User saved');
  //   print('Total users: ${box.length}');
  //   print(box.values.toList());
  //
  //   // 5️⃣ Go back to HomeScreen
  //   Navigator.pop(context);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add / Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) =>
                v!.length < 3 ? 'Min 3 characters' : null,
              ),

              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),

              TextFormField(
                controller: passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: [
                  ChoiceChip(
                    label: const Text('Male'),
                    selected: gender == 'Male',
                    onSelected: (_) => setState(() => gender = 'Male'),
                  ),
                  ChoiceChip(
                    label: const Text('Female'),
                    selected: gender == 'Female',
                    onSelected: (_) => setState(() => gender = 'Female'),
                  ),
                ],
              ),

              CheckboxListTile(
                title: const Text('Agree'),
                value: agree,
                onChanged: (v) => setState(() => agree = v!),
              ),

              CheckboxListTile(
                title: const Text('Accept'),
                value: accept,
                onChanged: (v) => setState(() => accept = v!),
              ),

              ElevatedButton(
                onPressed: saveUser,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
