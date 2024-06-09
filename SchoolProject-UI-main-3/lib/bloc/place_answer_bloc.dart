import 'package:bloc/bloc.dart';

abstract class PlaceAnswerEvent {}

class PlaceAnswerChanged extends PlaceAnswerEvent {
  final String answer;

  PlaceAnswerChanged(this.answer);
}

// State
class PlaceAnswerState {
  final String? answer;

  PlaceAnswerState(this.answer);
}

// Bloc
class PlaceAnswerBloc extends Bloc<PlaceAnswerEvent, PlaceAnswerState> {
  PlaceAnswerBloc() : super(PlaceAnswerState(null)) {
    on<PlaceAnswerChanged>(_onPlaceAnswerChanged);
  }
  void _onPlaceAnswerChanged(PlaceAnswerChanged event,Emitter<PlaceAnswerState> emit){
    emit(PlaceAnswerState(event.answer));
  }
}
