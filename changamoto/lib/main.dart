import 'package:flutter/material.dart';
import './forms/register.dart';

void main() => runApp(LoginSignPage());

class LoginSignPage extends StatelessWidget {
  const LoginSignPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Changamoto Portal',
      home: LoginScreen(),
    );
  }
}
