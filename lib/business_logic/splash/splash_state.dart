part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final int page;
  const SplashState({required this.page});

  factory SplashState.initial()=> const SplashState(page: 0);


  @override
  List<Object> get props => [];




  SplashState copyWith({
    int? page,
  }) {
    return SplashState(
      page: page ?? this.page,
    );
  }
}


