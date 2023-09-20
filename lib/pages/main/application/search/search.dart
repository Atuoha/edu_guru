import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color.dart';
import '../../../../gen/assets.gen.dart';
import '../../components/drawer.dart';
import '../../widgets/drawer_opener.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30.w,
          leading: drawerOpener(context: context),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 18),
              child: Icon(
                CupertinoIcons.bell_circle,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        drawer: buildDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Enter search keyword',
                  label: Text(
                    'Search Here',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
