import 'package:flutter/material.dart';

class CourseVideoTutorial extends StatefulWidget {
  const CourseVideoTutorial({super.key});

  @override
  State<CourseVideoTutorial> createState() => _CourseVideoTutorialState();
}

class _CourseVideoTutorialState extends State<CourseVideoTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: const Center(
        child: Text('Course Video Tutorial'),
      ),
    );
  }
}
