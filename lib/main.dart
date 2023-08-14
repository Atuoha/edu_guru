import 'package:flutter/material.dart';

void main() => runApp(EduGuru());

class EduGuru extends StatelessWidget {
  const EduGuru({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/edu_guru_transparent.png',
            width: 100
          ),
        ),
      ),
    );
  }
}

