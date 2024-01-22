import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:edirne_gezgini_ui/model/toVisit.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;


import '../model/place.dart';

class ToVisitPage extends StatefulWidget {
  const ToVisitPage({super.key});

  @override
  State<StatefulWidget> createState() => _ToVisitPageState();
}

class _ToVisitPageState extends State<ToVisitPage> {
  List<ToVisit> toVisitPlaces = TemporaryDatabase()
      .toVisits
      .where((toVisit) => toVisit.category == BasePlaceCategory.place)
      .toList();
  List<ToVisit> toVisitAccommodations = TemporaryDatabase()
      .toVisits
      .where((toVisit) => toVisit.category == BasePlaceCategory.accommodation)
      .toList();
  List<ToVisit> toVisitRestaurants = TemporaryDatabase()
      .toVisits
      .where((toVisit) => toVisit.category == BasePlaceCategory.restaurant)
      .toList();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "Gittiğim Yerler",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Gittiğim Mekanlar",
              style: TextStyle(
                  fontSize: 24,
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 16,
          ),
          //list places
          SizedBox(
            width: width * 100,
            height: height * 65,
            child: toVisitsPlacesListView(toVisitPlaces),
          ),

          const Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Gittiğim Konaklama Yerleri",
              style: TextStyle(
                  fontSize: 24,
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 16),

          //list accommodations
          SizedBox(
            width: width * 100,
            height: height * 65,
            child: toVisitsAccommodationsListView(toVisitAccommodations),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Gittiğim Restoranlar",
              style: TextStyle(
                  fontSize: 24,
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: width * 100,
            height: height * 65,
            child: toVisitsRestaurantListView(toVisitRestaurants),),

        ],
      ),
    );
  }

  Widget toVisitsPlacesListView(List<ToVisit> toVisitPlaces) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitPlaces.length,
        itemBuilder: (BuildContext context, int index) {
          Place currentPlace = toVisitPlaces[index].toVisitPlace as Place;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            PlaceCard(
                title: currentPlace.title,
                image: currentPlace.image
            ),
          );
        });
  }

  Widget toVisitsAccommodationsListView(List<ToVisit> toVisitAccommodations) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitAccommodations.length,
        itemBuilder: (BuildContext context, int index) {
          Accommodation currentAccommodation =
          toVisitAccommodations[index].toVisitPlace as Accommodation;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
                title: currentAccommodation.title,
                image: currentAccommodation.image),
          );
        });
  }
  Widget toVisitsRestaurantListView(List<ToVisit> toVisitRestaurant) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitRestaurant.length,
        itemBuilder: (BuildContext context, int index) {
          Restaurant currentRestaurant =
          toVisitRestaurants[index].toVisitPlace as Restaurant;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
                title: currentRestaurant.title,
                image: currentRestaurant.image),
          );
        });
  }

}
