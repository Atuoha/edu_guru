import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';


class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.size,
    required this.searchController,
    required this.setFilter,
  });

  final Size size;
  final TextEditingController searchController;
  final Function setFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width / 1.27,
          child: TextField(
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
          ),
        ),
        GestureDetector(
          onTap: () => setFilter(),
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Assets.icons.filter.path,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}