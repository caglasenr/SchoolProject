import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/restaurant_category.dart';

class Restaurant extends BasePlace{
  final String title;

  final String image;

  final String info;

  final String location;

  final RestaurantCategory category;

  Restaurant({required this.title, required this.image, required this.info, required this.location, required this.category});

}