import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medico_project/common/custom_button.dart';
import 'package:medico_project/common/custom_dropdown.dart';
import 'package:medico_project/common/custom_textfield.dart';
import 'package:medico_project/features/auth/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  final List<String> _users = ['Patient', 'Doctor'];

  @override
  void dispose() {
    _mobileNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Form(
                child: Column(
              children: [
                CustomTextField(
                  hint: 'Mobile Numbers',
                  controller: _mobileNumberController,
                  type: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: 'Password',
                  controller: _passwordController,
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropDown(items: _users, defaultItem: _users[0], onUpdateValue: (String? val){}),
                SizedBox(
                  height: 20,
                ),
                CustomButton(onPressed: () {}, text: 'Sign In'),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Need an account? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, SignUpScreen.routeName);
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
    );
  }
}
