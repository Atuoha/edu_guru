part of 'course_list_cubit.dart';

class CourseListState extends Equatable {
  final List<CourseItem> courseList;
  final CourseItem courseItem; // not using
  final ProcessingStatus processingStatus;
  final CustomError error;

  const CourseListState({
    required this.courseList,
    required this.processingStatus,
    required this.error,
    required this.courseItem,
  });

  factory CourseListState.initial() => CourseListState(
        courseList: const <CourseItem>[],
        courseItem: CourseItem(),
        processingStatus: ProcessingStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [
        courseList,
        processingStatus,
        error,
        courseItem,
      ];

  CourseListState copyWith({
    List<CourseItem>? courseList,
    ProcessingStatus? processingStatus,
    CustomError? error,
    CourseItem? courseItem,
  }) {
    return CourseListState(
      courseList: courseList ?? this.courseList,
      processingStatus: processingStatus ?? this.processingStatus,
      error: error ?? this.error,
      courseItem: courseItem ?? this.courseItem,
    );
  }

  @override
  String toString() {
    return 'CourseListState{courseList: $courseList,processingStatus:$processingStatus,courseItem: $courseItem}';
  }
}
