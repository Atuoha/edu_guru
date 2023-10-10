import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseTabHeader {
  final int index;
  String? title;
  IconData? icon;
  int? number;

  CourseTabHeader({
    required this.index,
    this.title = '',
    this.icon = Icons.abc,
    this.number = 0,
  });
}

final List<CourseTabHeader> courseTabHeaders = [
  CourseTabHeader(index: 0, title: 'Author Page'),
  CourseTabHeader(
    index: 1,
    icon: Platform.isAndroid? Icons.groups_outlined: CupertinoIcons.group,
    number: 2,
  ),
  CourseTabHeader(
    index: 2,
    icon:Platform.isAndroid? Icons.star_outline: CupertinoIcons.star,
    number: 0,
  ),
];