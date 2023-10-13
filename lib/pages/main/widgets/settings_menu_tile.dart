import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.title,
    required this.fnc,
  });

  final String title;
  final Function fnc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> fnc(),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          onPressed: () => fnc(),
          icon:  Icon(
            Icons.chevron_right,
            color: AppColors.primaryFourElementText,
          ),
        ),
      ),
    );
  }
}
