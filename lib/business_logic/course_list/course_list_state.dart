part of 'course_list_cubit.dart';

class CourseListState extends Equatable {
  final List<CourseItem> courseList;
  final ProcessingStatus processingStatus;
  final CustomError error;

  const CourseListState({
    required this.courseList,
    required this.processingStatus,
    required this.error,
  });

  factory CourseListState.initial() => CourseListState(
        courseList: const <CourseItem>[],
        processingStatus: ProcessingStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [
        courseList,
        processingStatus,
        error,
      ];

  CourseListState copyWith({
    List<CourseItem>? courseList,
    ProcessingStatus? processingStatus,
    CustomError? error,
  }) {
    return CourseListState(
      courseList: courseList ?? this.courseList,
      processingStatus: processingStatus ?? this.processingStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'CourseListState{courseList: $courseList,processingStatus:$processingStatus}';
  }
}
