import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medico_project/common/custom_button.dart';
import 'package:medico_project/common/custom_dropdown.dart';
import 'package:medico_project/common/custom_textfield.dart';
import 'package:medico_project/features/auth/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  String? _defaultRole = 'Patient';
  final List<String> genders = ['Male', 'Female', 'Other'];
  final String defaultGender = 'Male';
  final List<String> maritialStatus = ['Maried', 'Unmaried'];
  final String defaultMaritialStatus = 'Maried';
  final List<String> role = ['Patient', 'Doctor'];
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _signUpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void updateRole(String? value) {
      setState(() {
        widget._defaultRole = value;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Form(
                    child: Column(
                  children: [
                    CustomTextField(hint: 'Name', controller: _nameController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropDown(
                        items: widget.genders,
                        defaultItem: widget.genders[0],
                        onUpdateValue: (String? val) {}),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropDown(
                        items: widget.maritialStatus,
                        defaultItem: widget.maritialStatus[0],
                        onUpdateValue: (String? val) {}),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hint: 'password', controller: _passwordController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hint: 'confirm password',
                        controller: _confirmPasswordController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropDown(
                      items: widget.role,
                      defaultItem: widget.role[0],
                      onUpdateValue: updateRole,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hint: 'Address',
                      controller: _addressController,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(onPressed: () {}, text: 'Sign Up'),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 13.0, color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
