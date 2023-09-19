import 'package:flutter/material.dart';
import '../../common/routes/app_routes.dart';
import '../../gen/assets.gen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.splashScreen, (route) => false),
            child: const Icon(Icons.chevron_left, color: Colors.grey),
          ),
        ),
      ),
      body: Center(
        child: Image.asset(Assets.images.errorImg.path),
      ),
    );
  }
}
