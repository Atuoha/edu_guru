import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/routes/app_routes.dart';
import '../../../../constants/color.dart';
import '../../components/drawer.dart';
import '../../widgets/chat_contact_list_tile.dart';
import '../../widgets/drawer_opener.dart';

class ChatContactScreen extends StatefulWidget {
  const ChatContactScreen({super.key});

  @override
  State<ChatContactScreen> createState() => _ChatContactScreenState();
}

class _ChatContactScreenState extends State<ChatContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          title: const Text('Chat Contact List'),
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
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height / 1.2,
          child: ListView(
            children: List.generate(
              30,
              (index) => GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.chatScreen),
                child: const ChatContactListTile(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
