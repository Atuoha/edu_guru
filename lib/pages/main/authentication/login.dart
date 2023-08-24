import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();


  void submitCreds(){
    // Todo: Implement login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/icons-facebook.png'),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/icons/icons-google.png'),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/icons/icons-twitter.png'),
                  const SizedBox(width: 10),
                ],
              ),

              const SizedBox(height:20),

              TextField(
                controller: emailController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey.shade50),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
