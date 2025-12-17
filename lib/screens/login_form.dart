import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../database/db_helper.dart';
import 'view_users.dart'; // import the screen to view users

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedState;
  String? selectedCity;
  String selectedGender = '';
  bool agree = false;
  bool accept = false;

  List<String> states = ['Tamil Nadu', 'Kerala', 'Karnataka'];
  Map<String, List<String>> cities = {
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai'],
    'Kerala': ['Kochi', 'Trivandrum', 'Kozhikode'],
    'Karnataka': ['Bangalore', 'Mysore', 'Mangalore'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // First Name
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) =>
                value!.isEmpty ? 'Enter First Name' : null,
              ),
              const SizedBox(height: 10),

              // Phone
              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Enter Phone' : null,
              ),
              const SizedBox(height: 10),

              // Password
              TextFormField(
                controller: passCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Enter Password' : null,
              ),
              const SizedBox(height: 10),

              // State Dropdown
              DropdownButtonFormField<String>(
                value: selectedState,
                hint: const Text('Select State'),
                items: states
                    .map((state) => DropdownMenuItem(
                  value: state,
                  child: Text(state),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    selectedCity = null;
                  });
                },
                validator: (value) =>
                value == null ? 'Select a state' : null,
              ),
              const SizedBox(height: 10),

              // City Dropdown
              DropdownButtonFormField<String>(
                value: selectedCity,
                hint: const Text('Select City'),
                items: selectedState == null
                    ? []
                    : cities[selectedState!]!
                    .map((city) => DropdownMenuItem(
                  value: city,
                  child: Text(city),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                validator: (value) => value == null ? 'Select a city' : null,
              ),
              const SizedBox(height: 10),

              // Gender Radio Buttons
              Row(
                children: [
                  Radio<String>(
                    value: '',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  const Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),

              // Agree / Accept Checkboxes
              Row(
                children: [
                  Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  const Text('Agree'),
                  Checkbox(
                    value: accept,
                    onChanged: (value) {
                      setState(() {
                        accept = value!;
                      });
                    },
                  ),
                  const Text('Accept'),
                ],
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  // Create User object
                  UserModel user = UserModel(
                    firstName: nameCtrl.text,
                    gender: selectedGender,
                    phone: phoneCtrl.text,
                    password: passCtrl.text,
                    state: selectedState ?? '',
                    city: selectedCity ?? '',
                    agree: agree,
                    accept: accept,
                  );

                  // Insert into DB
                  final db = await DbHelper.database;       // get DB instance correctly
                  await db.insert('users', user.toMap());   // insert user


                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful ✅')),
                  );

                  // Reset form
                  setState(() {
                    nameCtrl.clear();
                    phoneCtrl.clear();
                    passCtrl.clear();
                    selectedState = null;
                    selectedCity = null;
                    selectedGender = 'Male';
                    agree = false;
                    accept = false;
                  });

                  // Navigate to ViewUsers screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ViewUsers()),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
