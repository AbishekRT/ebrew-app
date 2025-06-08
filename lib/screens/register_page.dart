// ignore_for_file: unused_import, avoid_print

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _birthdayController = TextEditingController();

  DateTime? _selectedDate; // Added here since _buildBirthdayField uses it

  void _register() {
    if (_formKey.currentState!.validate()) {
      print('Selected birthday: $_selectedDate');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: _inputDecoration('Full Name', Icons.person),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name cannot be empty';
        }
        return null;
      },
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: _inputDecoration('Email', Icons.email),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email cannot be empty';
        } else if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  TextFormField _buildBirthdayField() {
    return TextFormField(
      controller: _birthdayController,
      readOnly: true,
      decoration: _inputDecoration('Birthday', Icons.cake),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
            _birthdayController.text =
                '${picked.day}/${picked.month}/${picked.year}';
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Birthday cannot be empty';
        }
        return null;
      },
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: _inputDecoration('Password', Icons.lock),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  TextFormField _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      decoration: _inputDecoration('Confirm Password', Icons.lock_outline),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final headingStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? const Color(0xFFFFF3E0) : const Color(0xFF3E2723),
    );

    final subtextStyle = TextStyle(
      fontSize: 16,
      color: isDarkMode ? const Color(0xFFFFCCBC) : const Color(0xFF5D4037),
    );

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          isDarkMode ? const Color(0xFF6D4C41) : const Color(0xFFA1887F),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      textStyle: const TextStyle(fontSize: 16),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('eBrew Registration'),
        centerTitle: true,
        backgroundColor:
            isDarkMode ? const Color(0xFF4E342E) : const Color(0xFFD7CCC8),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 600 ? screenWidth : 500,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create your account', style: headingStyle),
                  const SizedBox(height: 10),
                  Text('Fill in the details below', style: subtextStyle),
                  const SizedBox(height: 30),
                  _buildNameField(),
                  const SizedBox(height: 20),
                  _buildBirthdayField(), // ✅ Birthday field added here
                  const SizedBox(height: 20),
                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildPasswordField(),
                  const SizedBox(height: 20),
                  _buildConfirmPasswordField(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _register,
                      icon: const Icon(Icons.app_registration),
                      label: const Text('Register'),
                      style: buttonStyle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
