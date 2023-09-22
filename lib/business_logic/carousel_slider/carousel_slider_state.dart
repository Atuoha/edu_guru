part of 'carousel_slider_cubit.dart';

class CarouselSliderState extends Equatable {
  final int currentCarouselIndex;
  final List<CarouselSliderItem> carouselSliders;

  const CarouselSliderState({
    required this.carouselSliders,
    required this.currentCarouselIndex,
  });

  factory CarouselSliderState.initial() => CarouselSliderState(
        carouselSliders: carouselSliderItems,
        currentCarouselIndex: 0,
      );

  @override
  List<Object> get props => [carouselSliders, currentCarouselIndex];

  CarouselSliderState copyWith({
    List<CarouselSliderItem>? carouselSliders,
    int? currentCarouselIndex,
  }) {
    return CarouselSliderState(
      carouselSliders: carouselSliders ?? this.carouselSliders,
      currentCarouselIndex: currentCarouselIndex ?? this.currentCarouselIndex,
    );
  }
}
