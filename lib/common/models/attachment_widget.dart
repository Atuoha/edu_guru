import 'package:flutter/material.dart';

class AttachmentWidget {
  final String title;
  final IconData icon;
  final Function actionHandler;

  const AttachmentWidget({
    required this.title,
    required this.icon,
    required this.actionHandler,
  });
}
