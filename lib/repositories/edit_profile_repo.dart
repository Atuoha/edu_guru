import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfileRepo {
  final BuildContext context;

  EditProfileRepo({required this.context});

  Future<void> editProfile({
    required String email,
    required String username,
    required String photoURL,
    String? password,
  }) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(photoURL);

    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': email,
      'username': username,
      'photo_url': photoURL,
    });

    if (password!.isNotEmpty) {
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
    }
  }
}
