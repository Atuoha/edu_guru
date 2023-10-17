import 'package:bloc/bloc.dart';
import 'package:edu_guru/common/models/custom_error.dart';
import 'package:equatable/equatable.dart';
import '../../common/models/course.dart';
import '../../constants/enums/processing_status.dart';

part 'course_list_state.dart';

class CourseListCubit extends Cubit<CourseListState> {
  CourseListCubit() : super(CourseListState.initial());

  // populate course list
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

  // toggle course to favorite
  void toggleCourseToFavorite({required int id}) {
    print('Am here');
    CourseItem courseItem =
        state.courseList.firstWhere((course) => course.id == id);
    courseItem.toggleFavorite();

    List<CourseItem> updatedCourseList = state.courseList.map((course) {
      if (course.id == id) {
        return course.copyWith(isFavorite: courseItem.isFavorite!);
      }
      return course;
    }).toList();

    emit(state.copyWith(courseList: updatedCourseList));
  }

  CourseItem findById({required int? id}) {
    return state.courseList.firstWhere((course) => course.id == id);
  }

  // emit error
  void emitError({required CustomError error}) {
    emit(
      state.copyWith(
        error: error,
        processingStatus: ProcessingStatus.error,
      ),
    );
  }

  // populate course detail
  void setCourseItem({required CourseItem courseItem}) {
    state.copyWith(courseItem: courseItem);
  }
}
