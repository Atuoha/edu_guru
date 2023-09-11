import 'package:edu_guru/business_logic/sign_in/sign_in_bloc.dart';
import 'package:edu_guru/constants/color.dart';
import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:edu_guru/pages/main/widgets/flutter_toast.dart';
import 'package:edu_guru/repositories/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../business_logic/signup/signup_bloc.dart';
import '../../../common/routes/app_routes.dart';
import '../../../constants/enums/status.dart';
import '../widgets/third_party_logins.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void signUpHandler() {
    FocusScope.of(context).unfocus();
    var valid = _formKey.currentState!.validate();
    _formKey.currentState!.save();
    if (!valid) {
      toastInfo(msg: 'Ops! Incomplete credentials!', status: Status.error);
      return;
    }

    AuthenticationRepo(context: context).handleSignUp();
  }

  navigateToSIgnIn() {
    Navigator.of(context).pushNamed(AppRoute.signInScreen);
  }

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() {
      setState(() {});
    });

    confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Register Account',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Padding(
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
                      'or use your email account to signup',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            context.read<SignUpBloc>().add(
                              SignUpUsernameEvent(
                                usernameController.text.trim(),
                              ),
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username can not be empty!';
                            }

                            if (value.length < 4) {
                              return 'Username is not valid';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'John Doe',
                            label: const Text(
                              'Username',
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
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            context.read<SignUpBloc>().add(
                                  SignUpEmailEvent(
                                    emailController.text.trim(),
                                  ),
                                );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email address can not be empty!';
                            }

                            if (!value.contains('@')) {
                              return 'Email address is not valid';
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
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isPasswordObscured,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            context.read<SignUpBloc>().add(
                                  SignUpPasswordEvent(
                                    passwordController.text.trim(),
                                  ),
                                );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can not be empty!';
                            }

                            if (value.length < 8) {
                              return 'Password must be up to 8 characters long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: passwordController.text.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isPasswordObscured =
                                            !isPasswordObscured;
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
                        const SizedBox(height:20),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: isConfirmPasswordObscured,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm Password can not be empty!';
                            }

                            if (passwordController.text != value) {
                              toastInfo(msg: 'Password mismatch!', status: Status.error);
                              return 'Password mismatch!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: confirmPasswordController.text.isNotEmpty
                                ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isConfirmPasswordObscured =
                                  !isConfirmPasswordObscured;
                                });
                              },
                              child: Icon(
                                isConfirmPasswordObscured
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
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () => navigateToSIgnIn(),
                        child: const Text(
                          'Already a user? Sign in',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
                    'Register',
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
          ],
        ),
      ),
    );
  }
}
