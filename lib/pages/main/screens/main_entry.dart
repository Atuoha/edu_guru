import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:edu_guru/pages/main/screens/chat/chat.dart';
import 'package:edu_guru/pages/main/screens/courses/courses.dart';
import 'package:edu_guru/pages/main/screens/home.dart';
import 'package:edu_guru/pages/main/screens/profile/profile.dart';
import 'package:edu_guru/pages/main/screens/search/search.dart';
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


  void setNewPage(int page){
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColors.primaryColor,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        initialActiveIndex: _pageIndex,
        items: [
          buildTabItem(Icons.home, 0),
          buildTabItem(Icons.search, 1),
          buildTabItem(Icons.play_arrow, 2),
          buildTabItem(Icons.chat, 3),
          buildTabItem(Icons.person, 4),
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
