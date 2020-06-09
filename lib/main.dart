import 'package:flutter/material.dart';
import 'package:uddhriti/screens/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uddhriti',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SignInPage(),
    );
  }
}