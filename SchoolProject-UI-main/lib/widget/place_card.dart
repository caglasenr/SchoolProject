import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:flutter/material.dart';

import '../model/place.dart';

class PlaceCard extends StatelessWidget {
  final String title;
  final String image;

  const PlaceCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    List<Place> favoritePlaces = TemporaryDatabase()
        .favorites
        .where((favorite) => favorite.category == BasePlaceCategory.place)
        .map((favorite) => favorite.favoritePlace as Place)
        .toList();

    List<Accommodation> favoriteAccommodations = TemporaryDatabase()
        .favorites
        .where(
            (favorite) => favorite.category == BasePlaceCategory.accommodation)
        .map((favorite) => favorite.favoritePlace as Accommodation)
        .toList();
    List<Restaurant> favoriteRestaurants = TemporaryDatabase()
        .favorites
        .where(
            (favorite) => favorite.category == BasePlaceCategory.restaurant)
        .map((favorite) => favorite.favoritePlace as Restaurant)
        .toList();

    return SizedBox(
      width: width * 50,
      height: height * 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: height * 45,
              width: width * 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width*38,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(84, 84, 84, 1)),
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                ),
              ),

              favoriteButton(favoritePlaces, favoriteAccommodations, favoriteRestaurants,title)
            ],
          ),
        ],
      ),
    );
  }

  Widget favoriteButton(List<Place> favoritePlaces,
      List<Accommodation> favoriteAccommodations,List<Restaurant> favoriteRestaurants, String currentTitle) {

    bool isFavoritesEmpty = favoritePlaces
        .where((place) => place.title == currentTitle)
        .isEmpty &&
        favoriteAccommodations
            .where((accommodation) => accommodation.title == currentTitle)
            .isEmpty &&
        favoriteRestaurants
            .where((restaurans) => restaurans.title == currentTitle)
            .isEmpty;

    return isFavoritesEmpty == true
        ? IconButton(onPressed: () => {/* add this as favorite to dataBase later */}, icon: const Icon(Icons.favorite_border))
        : IconButton(onPressed: () => {/* add this as favorite to dataBase later */}, icon: const Icon(Icons.favorite));


  }
}
