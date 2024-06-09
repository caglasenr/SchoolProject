///Visitaion page dart yorum
/*List<Visitation> visitedPlaces = TemporaryDatabase()
      .visitedPlaces
      .where((toVisit) => toVisit!.category == BasePlaceCategory.place)
      .toList();*/
/*@override
  void initState() {
    super.initState();
    _visitedPlacesBloc = VisitedPlacesBloc();
    _visitedPlacesBloc.add(LoadVisitedPlaces());

    _visitedPlacesBloc.stream.listen((state) {
      if (state is VisitedPlacesLoaded) {
        // Ziyaret edilen yerler yüklendikten sonra, kategorilere göre listeleri oluştur
        visitedPlaces = state.visitedPlaces
            .where((place) => place is VisitedPlace && place.category == BasePlaceCategory.place)
            .toList();
        visitedAccommodations = state.visitedPlaces
            .where((place) => place is VisitedPlace && place.category == BasePlaceCategory.accommodation)
            .toList();
        visitedRestaurants = state.visitedPlaces
            .where((place) => place is VisitedPlace && place.category == BasePlaceCategory.restaurant)
            .toList();
      }
    });
  }*/

/*List<VisitedPlace> visitedPlaces = TemporaryDatabase()
      .visitedPlaces
      .where((toVisit) => toVisit.category == BasePlaceCategory.place)
      .toList();

  List<VisitedPlace> visitedAccommodations = TemporaryDatabase()
      .visitedPlaces
      .where((toVisit) => toVisit.category == BasePlaceCategory.accommodation)
      .toList();
  List<VisitedPlace> visitedRestaurants = TemporaryDatabase()
      .visitedPlaces
      .where((toVisit) => toVisit.category == BasePlaceCategory.restaurant)
      .toList();*/
/* dil desteği için assets içne bir tranlation dosyası içine tr.json ve en.json*/