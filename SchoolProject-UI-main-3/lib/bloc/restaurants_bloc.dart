import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial());

  @override
  Stream<RestaurantsState> mapEventToState(RestaurantsEvent event) async* {
    if (event is LoadRestaurants) {
      try {
        // Burada restoranları yükleme işlemini gerçekleştirin, API'den veya veritabanından veri alabilirsiniz
        yield RestaurantsLoadSuccess(restaurants: loadedRestaurants);
      } catch (e) {
        yield RestaurantsLoadFailure(error: e.toString());
      }
    }
  }
}*/
// restaurants_events.dart
import 'package:equatable/equatable.dart';
import '../database/temporary_database.dart';
import '../model/restaurant.dart';

abstract class RestaurantsEvent extends Equatable {
  const RestaurantsEvent();

  @override
  List<Object> get props => [];
}

class LoadRestaurants extends RestaurantsEvent {}

// restaurants_state.dart

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object> get props => [];
}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsLoadSuccess extends RestaurantsState {
  final List<Restaurant> restaurants;

  const RestaurantsLoadSuccess({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}

class RestaurantsLoadFailure extends RestaurantsState {
  final String error;

  const RestaurantsLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial()){
    on<LoadRestaurants>(_onLoadRestaurants);
  }

  Future<void> _onLoadRestaurants(LoadRestaurants event,Emitter<RestaurantsState> emit)async{
    emit(RestaurantsInitial());
    try{
      List<Restaurant> loadedRestaurants = TemporaryDatabase().loadedRestaurants;
      emit(RestaurantsLoadSuccess(restaurants: loadedRestaurants));
    }catch(e){
      emit(RestaurantsLoadFailure(error: e.toString()));
    }
  }


}
