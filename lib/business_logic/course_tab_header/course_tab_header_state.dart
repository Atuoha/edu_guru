part of 'course_tab_header_cubit.dart';

class CourseTabHeaderState extends Equatable {
  final int tabHeaderIndex;
  final List<CourseTabHeader> tabHeaders;

  const CourseTabHeaderState({
    required this.tabHeaderIndex,
    required this.tabHeaders,
  });

  factory CourseTabHeaderState.initial() => CourseTabHeaderState(
        tabHeaderIndex: 0,
        tabHeaders: courseTabHeaders,
      );

  @override
  List<Object> get props => [tabHeaderIndex, tabHeaders];

  CourseTabHeaderState copyWith({
    int? tabHeaderIndex,
    List<CourseTabHeader>? tabHeaders,
  }) {
    return CourseTabHeaderState(
      tabHeaderIndex: tabHeaderIndex ?? this.tabHeaderIndex,
      tabHeaders: tabHeaders ?? this.tabHeaders,
    );
  }
}
