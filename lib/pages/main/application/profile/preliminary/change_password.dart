import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/theme/styles_manager.dart';
import '../../../../../constants/color.dart';
import '../../../../../constants/enums/status.dart';
import '../../../widgets/flutter_toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void submitForm() {
    FocusScope.of(context).unfocus();
    final valid = formKey.currentState!.validate();

    if (valid) {
      return;
    }
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
        title: Text(
          'Change Password',
          style: getRegularStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'You can change your password',
                style: getRegularStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: passwordController,
                      obscureText: isPasswordObscured,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {},
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: isConfirmPasswordObscured,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm Password can not be empty!';
                        }

                        if (passwordController.text != value) {
                          toastInfo(
                              msg: 'Password mismatch!', status: Status.error);
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
                          'Confirm Password',
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
              onTap: () => submitForm(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Change Password',
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
