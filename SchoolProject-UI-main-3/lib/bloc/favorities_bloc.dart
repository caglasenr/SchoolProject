import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/temporary_database.dart';
import '../model/enum/base_place_category.dart';
import '../model/favorite.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Favorite> favoritePlaces;
  final List<Favorite> favoriteAccommodations;

  const FavoriteLoaded(this.favoritePlaces, this.favoriteAccommodations);

  @override
  List<Object> get props => [favoritePlaces, favoriteAccommodations];
}

class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoading()){
    on<LoadFavorites>(_onLoadFavorites);
  }
  void _onLoadFavorites(LoadFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favoritePlaces = TemporaryDatabase()
          .favorites
          .where((favorite) => favorite.category == BasePlaceCategory.place)
          .toList();
      final favoriteAccommodations = TemporaryDatabase()
          .favorites
          .where((favorite) => favorite.category == BasePlaceCategory.accommodation)
          .toList();

      emit(FavoriteLoaded(favoritePlaces, favoriteAccommodations));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

}
