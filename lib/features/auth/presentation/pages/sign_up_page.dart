import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        Text('Sign Up Page' , style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w100,
          color: Colors.black,
        ),),
        Text('Sign Up Page' , style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),),
        Text('Sign Up Page' , style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),),
      ],
    )));
  }
}
