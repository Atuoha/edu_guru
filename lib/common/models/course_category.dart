class CourseCategory {
  final String id;
  final String title;

  CourseCategory({
    required this.id,
    required this.title,
  });
}

final List<CourseCategory> categories = [
  CourseCategory(id: '1', title: 'All'),
  CourseCategory(id: '2', title: 'Popular'),
  CourseCategory(id: '3', title: 'Newest'),
];
