import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/category/category_cubit.dart';
import '../widgets/single_course_categories.dart';

class CourseCategorySection extends StatelessWidget {
  const CourseCategorySection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 23,
      child: ListView.builder(
        itemCount: context.watch<CategoryCubit>().state.courseCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<CategoryCubit>().setCurrentCategoryIndex(index);
          },
          child: SingleCourseCategory(
            courseCategory:
                context.watch<CategoryCubit>().state.courseCategories[index],
            currentCourseCategory:
                context.watch<CategoryCubit>().state.currentCourseCategory,
            courseCategoryIndex: index,
          ),
        ),
      ),
    );
  }
}
