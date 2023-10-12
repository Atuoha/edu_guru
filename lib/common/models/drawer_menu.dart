import 'package:flutter/cupertino.dart';

class DrawerMenu {
  final String title;
  final IconData icon;
  final Function actionHandler;

  DrawerMenu({
    required this.title,
    required this.icon,
    required this.actionHandler,
  });
}


