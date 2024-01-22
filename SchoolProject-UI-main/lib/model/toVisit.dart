import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/base_place_category.dart';

class ToVisit{
  final BasePlace toVisitPlace;

  final BasePlaceCategory category;

 ToVisit({required this.toVisitPlace, required this.category});
}