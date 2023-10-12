import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../common/models/course_tab_header.dart';

part 'course_tab_header_state.dart';

class CourseTabHeaderCubit extends Cubit<CourseTabHeaderState> {
  CourseTabHeaderCubit() : super(CourseTabHeaderState.initial());

  void setNewTabHeaderIndex({required int index}) {
    emit(state.copyWith(tabHeaderIndex: index));

    print("Index: ${state.tabHeaderIndex}");
  }

  void resetTabHeaderIndex() {
    emit(
      state.copyWith(tabHeaderIndex: 0),
    );
  }
}
