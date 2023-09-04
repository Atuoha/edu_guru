import 'package:edu_guru/business_logic/sign_in/sign_in_bloc.dart';
import 'package:edu_guru/constants/color.dart';
import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:edu_guru/repositories/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void signUpHandler() {
    bool valid = formKey.currentState!.validate();
    if (!valid) {
      return;
    }

    context.read<AuthenticationRepo>().handleSignIn(SignInType.email);
    // Todo: Implement sign in
  }

  navigateToSIgnUp() {
    // Todo: navigate to to signup
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
          'Sign In',
          style: TextStyle(
            color: AppColors.primaryText,
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
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        context.read<SignInBloc>().add(
                              EmailEvent(
                                emailController.text.trim(),
                              ),
                            );
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
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
                          borderSide: const BorderSide(
                            color: AppColors.primaryFourElementText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.primaryFourElementText,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.primaryElementBg,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.primaryElementBg,
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
                onFieldSubmitted: (value) {
                  context.read<SignInBloc>().add(
                        PasswordEvent(
                          passwordController.text.trim(),
                        ),
                      );
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
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
                    borderSide: const BorderSide(
                      color: AppColors.primaryFourElementText,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryFourElementText,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryElementBg,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryElementBg,
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
            GestureDetector(
              onTap: () => signUpHandler(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => navigateToSIgnUp(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryFourElementText,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
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
