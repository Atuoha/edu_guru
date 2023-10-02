import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'chat/chat.dart';
import 'courses/courses.dart';
import 'home.dart';
import 'profile/profile.dart';
import 'search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class MainEntryScreen extends StatefulWidget {
  const MainEntryScreen({super.key});

  @override
  State<MainEntryScreen> createState() => _MainEntryScreenState();
}

class _MainEntryScreenState extends State<MainEntryScreen> {
  var _pageIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    CoursesScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void setNewPage(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primaryColor,
      ),
    );

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.primaryColor,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        initialActiveIndex: _pageIndex,
        items: [
          if (Platform.isIOS) ...[
            buildTabItem(CupertinoIcons.home, 0),
            buildTabItem(CupertinoIcons.search, 1),
            buildTabItem(CupertinoIcons.play_arrow, 2),
            buildTabItem(CupertinoIcons.chat_bubble_text, 3),
            buildTabItem(CupertinoIcons.person, 4),
          ] else ...[
            buildTabItem(Icons.home, 0),
            buildTabItem(Icons.search, 1),
            buildTabItem(Icons.play_arrow, 2),
            buildTabItem(Icons.chat, 3),
            buildTabItem(Icons.person, 4),
          ]
        ],
        onTap: setNewPage,
      ),
      body: _pages[_pageIndex],
    );
  }

  // custom tab item
  TabItem<dynamic> buildTabItem(IconData icon, int pageIndex) {
    return TabItem(
      icon: Icon(
        icon,
        color: AppColors.secondaryColor,
        size: _pageIndex == pageIndex ? 40 : 25,
      ),
    );
  }
}
