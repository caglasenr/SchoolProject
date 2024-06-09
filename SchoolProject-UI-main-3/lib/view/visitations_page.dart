import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/visited_places_bloc.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:edirne_gezgini_ui/model/visitation.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/place.dart';

class VisitationsPage extends StatefulWidget {
  const VisitationsPage({super.key});

  @override
  State<StatefulWidget> createState() => _VisitationsPageState();
}

class _VisitationsPageState extends State<VisitationsPage> {

  late VisitedPlacesBloc _visitedPlacesBloc;

  @override
  void initState() {
    super.initState();
    _visitedPlacesBloc = VisitedPlacesBloc();
    _visitedPlacesBloc.add(LoadVisitedPlaces());
  }


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
      body:BlocBuilder<VisitedPlacesBloc, VisitedPlacesState>(
        builder: (context, state) {
          if (state.status == VisitedPlacesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final visitedPlaces = state.visitedPlaces;
            final visitedAccommodations = visitedPlaces.where((place) =>
            place.category == BasePlaceCategory.accommodation).toList();
            final visitedRestaurants = visitedPlaces.where((place) =>
            place.category == BasePlaceCategory.restaurant).toList();

            return ListView(
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
                  child: toVisitsPlacesListView(
                      visitedPlaces, width * 0.5, height * 1),
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
                  child: toVisitsAccommodationsListView(
                      visitedAccommodations, width * 0.5, height * 1),
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
                    child: toVisitsRestaurantListView(
                        visitedRestaurants, width * 0.5, height * 1)),

              ],
            );
          }
        }));
  }
  @override
  //sayfa kapatıldığında visitedplacesbloc u temizler bellek sızıntısını önler
  void dispose() {
    _visitedPlacesBloc.close();
    super.dispose();
  }


  Widget toVisitsPlacesListView(List<VisitedPlace> toVisitPlaces, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitPlaces.length,
        itemBuilder: (BuildContext context, int index) {
          Place currentPlace = toVisitPlaces[index].visitedPlace as Place;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            PlaceCard(
                title: currentPlace.title,
                image: currentPlace.image,
                width: width,
                height: height,
                isVisited: true,
            ),
          );
        });
  }
  Widget toVisitsAccommodationsListView(List<VisitedPlace> toVisitAccommodations, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitAccommodations.length,
        itemBuilder: (BuildContext context, int index) {
          Accommodation currentAccommodation =
          toVisitAccommodations[index].visitedPlace as Accommodation;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
                title: currentAccommodation.title,
                image: currentAccommodation.image,
                width: width,
                height: height,
                isVisited: true,
            ),
          );
        });
  }
  Widget toVisitsRestaurantListView(List<VisitedPlace> toVisitRestaurant, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: toVisitRestaurant.length,
        itemBuilder: (BuildContext context, int index) {
          Restaurant currentRestaurant =
          toVisitRestaurant[index].visitedPlace as Restaurant;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
                title: currentRestaurant.title,
                image: currentRestaurant.image,
                width: width,
                height: height,
                isVisited: true,
            ),
          );
        });
  }




}


