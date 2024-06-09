import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/visitation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class VisitedPlacesEvent {}

class LoadVisitedPlaces extends VisitedPlacesEvent {}


enum VisitedPlacesStatus { loading, loaded }

class VisitedPlacesState {
  final List<VisitedPlace> visitedPlaces;
  final VisitedPlacesStatus status;

  VisitedPlacesState(this.visitedPlaces, this.status);
}


class VisitedPlacesBloc extends Bloc<VisitedPlacesEvent, VisitedPlacesState> {
  VisitedPlacesBloc() : super(VisitedPlacesState([], VisitedPlacesStatus.loading)){
    on<LoadVisitedPlaces>(_onLoadVisitedPlaces);
  }

  Future<void> _onLoadVisitedPlaces(LoadVisitedPlaces event,Emitter<VisitedPlacesState> emit) async {
    final List<VisitedPlace> visitedPlaces= TemporaryDatabase().visitedPlaces;
    emit(VisitedPlacesState(visitedPlaces, VisitedPlacesStatus.loaded));
  }


}
