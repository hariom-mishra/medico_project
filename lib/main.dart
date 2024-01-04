import 'package:flutter/material.dart';
import 'package:medico_project/common/bottom_bar.dart';
import 'package:medico_project/constants/global_variables.dart';
import 'package:medico_project/features/auth/screens/login_screen.dart';
import 'package:medico_project/features/auth/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          primary: GlobalVariables.primary,
        ),
        appBarTheme: AppBarTheme(backgroundColor: GlobalVariables.primary, foregroundColor: GlobalVariables.backgroundColor)
      ),
      
      home: BottomBar(),
      routes: {
        LoginScreen.routeName: (context)=>LoginScreen(),
        SignUpScreen.routeName: (context)=>SignUpScreen(),
      },
    );
  }
}

