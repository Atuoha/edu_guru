import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';
import '../../components/drawer.dart';
import '../../widgets/drawer_opener.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          title: const Text('Message'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Platform.isAndroid
                    ? Icons.notifications_outlined
                    : CupertinoIcons.bell_circle,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        drawer: const DrawerComponent(),
      ),
    );
  }
}
