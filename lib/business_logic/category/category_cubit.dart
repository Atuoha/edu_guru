import 'package:bloc/bloc.dart';
import 'package:edu_guru/common/models/course_category.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());

  void setCurrentCategoryIndex(int categoryIndex) {
    emit(
      state.copyWith(currentCourseCategory: categoryIndex),
    );
  }
}
