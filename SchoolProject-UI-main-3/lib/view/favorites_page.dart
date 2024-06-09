import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import '../bloc/favorities_bloc.dart';
import '../model/favorite.dart';
import '../model/place.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = FavoriteBloc();
    _favoriteBloc.add(LoadFavorites());
  }

  @override
  void dispose() {
    _favoriteBloc.close();
    super.dispose();
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
          "Favorilerim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: _favoriteBloc,
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: AutoSizeText(
                    "Favori mekanlarım",
                    style: TextStyle(
                      fontSize: 24,
                      color: constants.primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: width * 100,
                  height: height * 65,
                  child: favoritePlacesListView(state.favoritePlaces, width * 0.5, height * 1),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: AutoSizeText(
                    "Favori konaklama yerlerim",
                    style: TextStyle(
                      fontSize: 24,
                      color: constants.primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: width * 100,
                  height: height * 65,
                  child: favoriteAccommodationsListView(state.favoriteAccommodations, width * 0.5, height * 1),
                ),
              ],
            );
          } else if (state is FavoriteError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget favoritePlacesListView(List<Favorite> favoritePlaces, double width, double height) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: favoritePlaces.length,
      itemBuilder: (BuildContext context, int index) {
        Place currentPlace = favoritePlaces[index].favoritePlace as Place;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlaceCard(
            title: currentPlace.title,
            image: currentPlace.image,
            width: width,
            height: height,
            isVisited: false,
          ),
        );
      },
    );
  }

  Widget favoriteAccommodationsListView(List<Favorite> favoriteAccommodations, double width, double height) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: favoriteAccommodations.length,
      itemBuilder: (BuildContext context, int index) {
        Accommodation currentAccommodation = favoriteAccommodations[index].favoritePlace as Accommodation;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlaceCard(
            title: currentAccommodation.title,
            image: currentAccommodation.image,
            width: width,
            height: height,
            isVisited: false,
          ),
        );
      },
    );
  }
}

