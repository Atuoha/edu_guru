import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../common/models/carousel_sliders.dart';

part 'carousel_slider_state.dart';

class CarouselSliderCubit extends Cubit<CarouselSliderState> {
  CarouselSliderCubit() : super(CarouselSliderState.initial());

  void setCurrentCarouselIndex(int carouselIndex) {
    emit(
      state.copyWith(currentCarouselIndex: carouselIndex),
    );
  }
}
