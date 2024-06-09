import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../database/temporary_database.dart';
import '../model/place.dart';

abstract class PlacesEvent extends Equatable {
  const PlacesEvent();

  @override
  List<Object> get props => [];
}

class LoadPlaces extends PlacesEvent {}

// places_state.dart

abstract class PlacesState extends Equatable {
  const PlacesState();

  @override
  List<Object> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

/*class PlacesLoaded extends PlacesState {
  final List<Place> places;

  const PlacesLoaded(this.places);

  @override
  List<Object> get props => [places];
}*/


class PlacesLoadSuccess extends PlacesState {
  final List<Place> places;

  const PlacesLoadSuccess({required this.places});

  @override
  List<Object> get props => [places];
}

class PlacesLoadFailure extends PlacesState {
  final String error;

  const PlacesLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesInitial()) {
    on<LoadPlaces>(_onLoadPlaces);
  }

  Future<void> _onLoadPlaces(LoadPlaces event, Emitter<PlacesState> emit ) async{
    emit(PlacesLoading());
    try{
      List<Place> loadedPlaces = TemporaryDatabase().loadedPlaces;
      emit(PlacesLoadSuccess(places: loadedPlaces));
    }catch(e){
      emit(PlacesLoadFailure(error: e.toString()));
    }
  }

}
