import 'package:flutter/material.dart';

class ProfileMenu {
  final IconData icon;
  final String title;
  final Function function;

  ProfileMenu({
    required this.title,
    required this.icon,
    required this.function,
  });
}
