//import 'package:edirne_gezgini_ui/view/account_page.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter/material.dart';

import '../bloc/place_bloc.dart';
import '../model/place.dart';

/*class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Place> historicalPlaces = TemporaryDatabase()
        .loadedPlaces
        .where((place) => place.category == PlaceCategory.historical)
        .toList();
    List<Place> museums = TemporaryDatabase()
        .loadedPlaces
        .where((place) => place.category == PlaceCategory.museum)
        .toList();

    double width = MediaQuery.of(context).size.width/100;
    double height = MediaQuery.of(context).size.height/100;

    return Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              museumsPopupMenuItem(),

              restaurantsPopupMenuItem(context),

              hotelsPopupMenuItem(context)
            ],

            icon: const Icon(Icons.menu),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/profil.jpg"),
                    ),
                  ),
                ),
              ),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const AccountPage()));
              },
            )
          ],
          title: const Center(
              child: AutoSizeText(
            "EDİRNE GEZGİNİ",
            style: TextStyle(fontWeight: FontWeight.bold,color: constants.primaryTextColor),
          )),
          scrolledUnderElevation: 0.0,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          const HeroArea(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
                "Tarihi Mekanlar",
                textAlign: TextAlign.left,
                minFontSize: 15,
                style: TextStyle(
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
          ),
          const SizedBox(height: 16),
          
          //list historical places
          SizedBox(
            width: width*100,
            height: height*65,
            child: historicalPlacesListView(historicalPlaces, width*0.5, height*1),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
                "Müzeler",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
          ),

          const SizedBox(height: 16),
          
          //list museums
          SizedBox(
              width: width*50,
              height: height*65,
              child: museumsListView(museums, width*0.5, height*1)),
        ]),
      );
  }

  Widget historicalPlacesListView(List<Place> historicalPlaces, double width, double height) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: historicalPlaces.length,
      itemBuilder: (BuildContext context, int index) {
        Place currentHistoricalPlace = historicalPlaces[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: PlaceCard(
              title: currentHistoricalPlace.title,
              image: currentHistoricalPlace.image,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlaceDetailsPage(place: currentHistoricalPlace, category: BasePlaceCategory.place,)));
            },
          ),
        );
      },
    );
  }

  Widget museumsListView(List<Place> museums, double width, double height) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: museums.length,
      itemBuilder: (BuildContext context, int index) {
        Place currentMuseum = museums[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: PlaceCard(
              title: currentMuseum.title,
              image: currentMuseum.image,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlaceDetailsPage(place: currentMuseum, category: BasePlaceCategory.place,)));
            },
          ),
        );
      },
    );
  }

  PopupMenuItem<String> restaurantsPopupMenuItem(BuildContext context){
    return PopupMenuItem<String>(
      value: 'Restoranlar',
      child: const Text('Restoranlar', style: TextStyle(fontSize: 20),),
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const RestaurantsPage())),
    );
  }

  PopupMenuItem<String> hotelsPopupMenuItem(BuildContext context){
    return PopupMenuItem<String>(
      value: 'Oteller',
      child: const Text('Oteller', style: TextStyle(fontSize: 20),),
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const HotelsPage())),
    );
  }

  PopupMenuItem<String> museumsPopupMenuItem(){
    return const PopupMenuItem<String>(
      value: 'Müzeler',
      child: Text('Müzeler', style: TextStyle(fontSize: 20)),
    );
  }


}*/
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlacesBloc _placeBloc;

  @override
  void initState() {
    super.initState();
    _placeBloc = PlacesBloc();
    _placeBloc.add(LoadPlaces());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _placeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<PlacesBloc, PlacesState>(
          builder: (context, state) {
            if (state is PlacesInitial || state is PlacesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlacesLoadSuccess) {
              return _buildPlacesList(state.places);
            } else if (state is PlacesLoadFailure) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('Unexpected state'));
            }
          },
        ),/*BlocProvider(
          create: (context) => _placeBloc,
          child: BlocBuilder<PlacesBloc, PlacesState>(
            builder: (context, state) {
              if (state is PlacesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PlacesLoaded) {
                return _buildPlacesList(state.places);
              } else if (state is PlacesLoadFailure) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('Unexpected state'));
              }
            },
          ),
        ),*/
      ),
    );
  }

  Widget _buildPlacesList(List<Place> places) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return ListTile(
          title: Text(place.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaceDetailsPage(place: place,),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _placeBloc.close();
    super.dispose();
  }
}
