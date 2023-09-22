part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final int currentCourseCategory;
  final List<CourseCategory> courseCategories;

  const CategoryState({
    required this.courseCategories,
    required this.currentCourseCategory,
  });

  factory CategoryState.initial() => CategoryState(
    courseCategories: categories,
    currentCourseCategory: 0,
  );

  @override
  List<Object> get props => [courseCategories, currentCourseCategory];

  CategoryState copyWith({
    List<CourseCategory>? courseCategories,
    int? currentCourseCategory,
  }) {
    return CategoryState(
      courseCategories: courseCategories ?? this.courseCategories,
      currentCourseCategory: currentCourseCategory ?? this.currentCourseCategory,
    );
  }
}
