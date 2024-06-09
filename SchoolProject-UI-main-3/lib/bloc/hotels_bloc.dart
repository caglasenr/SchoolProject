import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*abstract class HotelsEvent {}

class LoadHotels extends HotelsEvent {}

abstract class HotelsState {}

class HotelsInitial extends HotelsState {}

class HotelsLoadSuccess extends HotelsState {
  final List<Accommodation> hotels;

  HotelsLoadSuccess(this.hotels);
}

class HotelsLoadFailure extends HotelsState {
  final String errorMessage;

  HotelsLoadFailure(this.errorMessage);
}
class HotelsLoaded extends HotelsState {
  final List<Accommodation> hotels;

  HotelsLoaded(this.hotels);
}

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final TemporaryDatabase _temporaryDatabase;

  HotelsBloc(this._temporaryDatabase) : super(HotelsInitial());

  Stream<HotelsState> mapEventToState(HotelsEvent event) async* {
    if (event is LoadHotels) {
      yield* _mapLoadHotelsToState();
    }
  }

  Stream<HotelsState> _mapLoadHotelsToState() async* {
    try {
      final List<Accommodation> hotels = _temporaryDatabase.hotels;
      yield HotelsLoadSuccess(hotels);
    } catch (e) {
      yield HotelsLoadFailure(e.toString());
    }
  }
}*/
abstract class HotelsEvent extends Equatable{
  const HotelsEvent();

  @override
  List<Object> get props => [];
}
class LoadHotels extends HotelsEvent{

}
// hotels_state.dart
abstract class HotelsState extends Equatable {
   hotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {
  @override
  String hotelsState() => "Initial State";
}

class HotelsLoadSuccess extends HotelsState {
  final List<Accommodation> hotels;

   HotelsLoadSuccess({required this.hotels});

  @override
  List<Object> get props => [hotels];
  @override
  String hotelsState() => "Load Success State";

}

class HotelsLoadFailure extends HotelsState {
  final String error;

   HotelsLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
  @override
  String hotelsState() => "Load Failure State";

}

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  HotelsBloc() : super(HotelsInitial()){
    on<LoadHotels>(_onLoadHotels);
  }
  Future<void> _onLoadHotels(LoadHotels event,Emitter<HotelsState> emit) async {
    emit(HotelsInitial());
    try{
      List<Accommodation> loadedhotels = TemporaryDatabase().loadedHotels;
      emit(HotelsLoadSuccess(hotels: loadedhotels));
    }catch(e){
      emit(HotelsLoadFailure(error: e.toString()));
    }
  }

}

