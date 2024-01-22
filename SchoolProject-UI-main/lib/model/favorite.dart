import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/base_place_category.dart';

class Favorite{
  final BasePlace favoritePlace;

  final BasePlaceCategory category;

  Favorite({required this.favoritePlace, required this.category});
}