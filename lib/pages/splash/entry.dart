import 'dart:async';

import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});


  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.splashScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.eduGuruTransparent.path),
      ),
    );
  }
}
