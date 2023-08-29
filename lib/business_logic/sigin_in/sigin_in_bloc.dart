import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sigin_in_event.dart';
part 'sigin_in_state.dart';

class SiginInBloc extends Bloc<SiginInEvent, SiginInState> {
  SiginInBloc() : super(SiginInInitial()) {
    on<SiginInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
