import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';

Widget drawerOpener({
  required BuildContext context,
}) =>
    Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset(
              Assets.icons.menu.path,
            ),
          ),
        );
      },
    );
