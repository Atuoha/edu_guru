import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/color.dart';
import '../../components/drawer.dart';
import '../../components/search_section.dart';
import '../../widgets/drawer_opener.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  void setFilter() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              SearchSection(
                size: size,
                searchController: searchController,
                setFilter: setFilter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
