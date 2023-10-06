import 'dart:io';
import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/color.dart';
import '../../../../../constants/enums/image_source.dart';
import '../../../../../constants/enums/status.dart';
import '../../../../../repositories/home_repo.dart';
import '../../../widgets/flutter_toast.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late HomeRepo homeRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  XFile? selectedImage;
  bool isImagePicked = false;
  final ImagePicker _picker = ImagePicker();
  bool changePassword = false;

  // for selecting photo
  Future _selectPhoto(KImageSource source) async {
    XFile? pickedImage;
    switch (source) {
      case KImageSource.camera:
        pickedImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 600,
          maxHeight: 600,
        );
        break;
      case KImageSource.gallery:
        pickedImage = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 600,
          maxHeight: 600,
        );
        break;
    }
    if (pickedImage == null) {
      return null;
    }

    // assign the picked image to the profileImage
    setState(() {
      selectedImage = pickedImage;
      isImagePicked = true;
    });
  }

  void saveDetails() {
    // todo save details
  }

  void setValues() {
    setState(() {
      usernameController.text = homeRepo.userItem.name!;
      emailController.text = homeRepo.userItem.email!;
    });
  }

  @override
  void initState() {
    super.initState();
    homeRepo = HomeRepo(context: context);
    homeRepo.init();

    setValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryOpacity,
        onPressed: () => saveDetails(),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    isImagePicked
                        ? CircleAvatar(
                            radius: 65,
                            backgroundColor: AppColors.primaryColor,
                            child: Image.file(
                              File(selectedImage!.path),
                            ),
                          )
                        : CircleAvatar(
                            radius: 65,
                            backgroundColor: AppColors.primaryColor,
                            backgroundImage: NetworkImage(
                              homeRepo.userItem.avatar!,
                            ),
                          ),
                    Positioned(
                      bottom: 3,
                      right: 5,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => _selectPhoto(KImageSource.camera),
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryOpacity,
                                shape: BoxShape.circle,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectPhoto(KImageSource.gallery),
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryOpacity,
                                shape: BoxShape.circle,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  CupertinoIcons.photo,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter the profiles details that you want to edit',
                  style: getRegularStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: usernameController,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username can not be empty!';
                    }

                    if (value.length < 4) {
                      return 'Username is not valid';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintText: 'John Doe',
                    label: Text(
                      'Username',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email address can not be empty!';
                    }

                    if (!value.contains('@')) {
                      return 'Email address is not valid';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: 'johndoe@gmail.com',
                    label: Text(
                      'Email',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number can not be empty!';
                    }

                    if (value.length < 10) {
                      return 'Phone number is not valid';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: Colors.black,
                    ),
                    hintText: '09033-334-9083',
                    label: Text(
                      'Phone Number',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  value: changePassword,
                  onChanged: (value) => setState(
                    () {
                      changePassword = value!;
                    },
                  ),
                  title: const Text('Do you want to change your password'),
                  checkColor: Colors.white,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                changePassword
                    ? TextFormField(
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
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                changePassword
                    ? TextFormField(
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
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
