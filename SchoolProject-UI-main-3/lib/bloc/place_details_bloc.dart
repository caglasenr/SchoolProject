/*import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceDetailsBloc extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  final TemporaryDatabase _database;

  PlaceDetailsBloc(this._database) : super(PlaceDetailsState(BasePlace(), PlaceDetailsStatus.loading));

  @override
  Stream<PlaceDetailsState> mapEventToState(PlaceDetailsEvent event) async* {
    if (event is LoadPlaceDetails) {
      yield* _mapLoadPlaceDetailsToState(event.place);
    }
  }

  Stream<PlaceDetailsState> _mapLoadPlaceDetailsToState(BasePlace place) async* {
    try {
      // Burada istenen yerin detaylarını yükleyebilirsiniz
      // Örneğin, bir veritabanından veya bir API'den veri getirme işlemi yapılabilir.
      // Şu anlık varsayılan bir değer dönüyoruz.
      yield PlaceDetailsState(BasePlace(title: "Default Title", info: "Default Info", location: "Default Location", image: "default_image.jpg"), PlaceDetailsStatus.loaded);
    } catch (e) {
      yield PlaceDetailsState(BasePlace(), PlaceDetailsStatus.error);
    }
  }
}*/
/*class DetailBloc {
  Future<PlaceDetail> getPlaceDetail(Place place) async {
    // Burada verilen yerin detaylarını almak için gereken işlemleri yapın
  }

  Future<HotelDetail> getHotelDetail(Hotel hotel) async {
    // Burada verilen otelin detaylarını almak için gereken işlemleri yapın
  }

  Future<RestaurantDetail> getRestaurantDetail(Restaurant restaurant) async {
    // Burada verilen restoranın detaylarını almak için gereken işlemleri yapın
  }
}
*/
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceDetailsPageBloc extends Bloc<PlaceDetailsPageEvent, PlaceDetailsPageState> {
  PlaceDetailsPageBloc() : super(PlaceDetailsPageInitial());

  Stream<PlaceDetailsPageState> mapEventToState(PlaceDetailsPageEvent event) async* {
  }
}

abstract class PlaceDetailsPageEvent {}

abstract class PlaceDetailsPageState {}

class PlaceDetailsPageInitial extends PlaceDetailsPageState {}
