import 'package:edu_guru/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/third_party_logins.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;

  void submitCreds() {
    // Todo: Implement login
  }

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ThirdPartyLogin(),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'or use your email account login',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Email is not valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'johndoe@gmail.com',
                        label: const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: isPasswordObscured,
                textInputAction: TextInputAction.done,
                validator: (value){
                  if(value!.isEmpty || value.length < 8){
                    return 'Password is not valid';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: passwordController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObscured = !isPasswordObscured;
                            });
                          },
                          child: Icon(
                            isPasswordObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        )
                      : const SizedBox.shrink(),
                  prefixIcon: const Icon(
                    Icons.key,
                    color: Colors.black,
                  ),
                  hintText: '*******',
                  label: const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              child: const Center(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
