import 'package:flutter_bloc/flutter_bloc.dart';

// Event
abstract class AccommodationEvent {}

class AccommodationChanged extends AccommodationEvent {
  final String answer;

  AccommodationChanged(this.answer);
}

// State
class AccommodationState {
  final String? answer;

  AccommodationState(this.answer);
}

// Bloc
class AccommodationBloc extends Bloc<AccommodationEvent, AccommodationState> {
  AccommodationBloc() : super(AccommodationState(null)){
    on<AccommodationChanged>(_onAccommodationChanged);
  }

  void _onAccommodationChanged(AccommodationChanged event,Emitter<AccommodationState> emit){
    emit(AccommodationState(event.answer));
  }
}

// Event
