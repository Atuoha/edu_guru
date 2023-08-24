part of 'splash_bloc.dart';

class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}



class NextSlide extends SplashEvent{

}

class PreviousSlide extends SplashEvent{

}

class LaunchApp extends SplashEvent{

}
