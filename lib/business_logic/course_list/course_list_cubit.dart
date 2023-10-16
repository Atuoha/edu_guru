import 'package:bloc/bloc.dart';
import 'package:edu_guru/common/models/custom_error.dart';
import 'package:equatable/equatable.dart';
import '../../common/models/course.dart';
import '../../constants/enums/processing_status.dart';

part 'course_list_state.dart';

class CourseListCubit extends Cubit<CourseListState> {
  CourseListCubit() : super(CourseListState.initial());

  void populateCourseList({
    required List<CourseItem> courseList,
  }) {
    emit(
      state.copyWith(
        processingStatus: ProcessingStatus.waiting,
      ),
    );

    try {
      emit(
        state.copyWith(
          processingStatus: ProcessingStatus.success,
          courseList: courseList,
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          processingStatus: ProcessingStatus.error,
          error: e,
        ),
      );
    }
  }

  // check if course is on favorite
  bool isCourseOnFav({required int id}) {
    CourseItem courseItem =
        state.courseList.firstWhere((course) => course.id == id);
    return courseItem.isFavorite!;
  }

  void toggleCourseToFavorite({required int id}) {
    CourseItem courseItem =
        state.courseList.firstWhere((course) => course.id == id);
    courseItem.toggleFavorite();

  }

  void emitError({required CustomError error}) {
    emit(
      state.copyWith(
        error: error,
        processingStatus: ProcessingStatus.error,
      ),
    );
  }
}
