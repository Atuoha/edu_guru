import 'package:flutter/material.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';

Widget headerTitle({required String title}) {
  return Column(
    children: [
      const SizedBox(height: 15),
      Text(
        title,
        style: getBoldStyle(
          color: Colors.black,
          fontSize: FontSize.s16,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
