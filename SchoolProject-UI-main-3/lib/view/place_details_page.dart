
/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/place_details_bloc.dart';
import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/accommodation.dart';
import '../model/place.dart';

abstract class PlaceDetailsEvent {}

class LoadPlaceDetails extends PlaceDetailsEvent {}

enum PlaceDetailsStatus { loading, loaded }

class PlaceDetailsState {
  final BasePlace place;
  final PlaceDetailsStatus status;

  PlaceDetailsState(this.place, this.status);
}


class PlaceDetailsPage extends StatefulWidget {
  final BasePlace place;

  final BasePlaceCategory category;

  const PlaceDetailsPage({super.key, required this.place, required this.category});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late PlaceDetailsBloc _placeDetailsBloc;

  @override
  void initState() {
    super.initState();
    _placeDetailsBloc = PlaceDetailsBloc(TemporaryDatabase());
    _placeDetailsBloc.add(LoadPlaceDetails());
  }


  @override
  Widget build(BuildContext context) {
    late String title;
    late String? info;
    late String location;
    late String image;

    if(widget.category == BasePlaceCategory.place){
      Place currentPlace = widget.place as Place;
      title = currentPlace.title;
      info = currentPlace.info;
      location = currentPlace.location;
      image = currentPlace.image;
    } else{
      Accommodation currentAccommodation = widget.place as Accommodation;
      title = currentAccommodation.title;
      info = currentAccommodation.info;
      location = currentAccommodation.location;
      image = currentAccommodation.image;
    }

    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: height * 30,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              info!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: AutoSizeText(
                "Konum",
                style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),

            AutoSizeText(
              location,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
*/
/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/place_details_bloc.dart';
import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:flutter/material.dart';
import '../model/accommodation.dart';
import '../model/place.dart';


class PlaceDetailsPage extends StatefulWidget {
  final BasePlace place;

  final BasePlaceCategory category;

  const PlaceDetailsPage({super.key, required this.place, required this.category});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late PlaceDetailsBloc _placeDetailsBloc;


  @override
  void initstate(){
    super.initState();
    _placeDetailsBloc=PlaceDetailsBloc(TemporaryDatabase());
    _placeDetailsBloc.add(LoadPlaceDetails());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _placeDetailsBloc,
      child: BlocBuilder<PlaceDetailsBloc, PlaceDetailsState>(
        builder: (context, state) {
          if (state.status == PlaceDetailsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == PlaceDetailsStatus.loaded) {
            return _buildPlaceDetails(state.place);
          } else {
            return Text('Error occurred while loading place details');
          }
        },
      ),
    );
  }
  Widget _buildPlaceDetails(BasePlace place) {
    late String title;
    late String? info;
    late String location;
    late String image;

    if(widget.category == BasePlaceCategory.place){
      Place currentPlace = widget.place as Place;
      title = currentPlace.title;
      info = currentPlace.info;
      location = currentPlace.location;
      image = currentPlace.image;
    }
    else if (widget.category == BasePlaceCategory.accommodation) {
      Accommodation currentAccommodation = widget.place as Accommodation;
      title = currentAccommodation.title;
      info = currentAccommodation.info;
      location = currentAccommodation.location;
      image = currentAccommodation.image;
    }
    else if (widget.category == BasePlaceCategory.restaurant) {
      Restaurant currentRestaurant = widget.place as Restaurant;
      title = currentRestaurant.title;
      info = currentRestaurant.info;
      location = currentRestaurant.location;
      image = currentRestaurant.image;
    }



    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: height * 30,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              info!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: AutoSizeText(
                "Konum",
                style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),

            AutoSizeText(
              location,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}*/
/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:flutter/material.dart';
import '../model/accommodation.dart';
import '../model/place.dart';


class PlaceDetailsPage extends StatefulWidget {
  final BasePlace place;

  final BasePlaceCategory category;

  const PlaceDetailsPage({super.key, required this.place, required this.category});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late PlaceDetailsBloc _placeDetailsBloc;

  @override
  void initState() {
    super.initState();
    _placeDetailsBloc = PlaceDetailsBloc();
    _loadPlaceDetails();
  }

  @override
  void dispose() {
    _placeDetailsBloc.dispose();
    super.dispose();
  }

  void _loadPlaceDetails() {
    _placeDetailsBloc.loadPlaceDetails(widget.place, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    late String title;
    late String? info;
    late String location;
    late String image;

    if(widget.category == BasePlaceCategory.place){
      Place currentPlace = widget.place as Place;
      title = currentPlace.title;
      info = currentPlace.info;
      location = currentPlace.location;
      image = currentPlace.image;
    }
    else if (widget.category == BasePlaceCategory.accommodation) {
      Accommodation currentAccommodation = widget.place as Accommodation;
      title = currentAccommodation.title;
      info = currentAccommodation.info;
      location = currentAccommodation.location;
      image = currentAccommodation.image;
    }
    else if (widget.category == BasePlaceCategory.restaurant) {
      Restaurant currentRestaurant = widget.place as Restaurant;
      title = currentRestaurant.title;
      info = currentRestaurant.info;
      location = currentRestaurant.location;
      image = currentRestaurant.image;
    }



    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: height * 30,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              info!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: AutoSizeText(
                "Konum",
                style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),

            AutoSizeText(
              location,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}*/
/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:flutter/material.dart';
import '../model/accommodation.dart';
import '../model/place.dart';


class PlaceDetailsPage extends StatefulWidget {
  final BasePlace place;

  final BasePlaceCategory category;

  const PlaceDetailsPage({super.key, required this.place, required this.category});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    late String title;
    late String? info;
    late String location;
    late String image;

    if(widget.category == BasePlaceCategory.place){
      Place currentPlace = widget.place as Place;
      title = currentPlace.title;
      info = currentPlace.info;
      location = currentPlace.location;
      image = currentPlace.image;
    }
    else if (widget.category == BasePlaceCategory.accommodation) {
      Accommodation currentAccommodation = widget.place as Accommodation;
      title = currentAccommodation.title;
      info = currentAccommodation.info;
      location = currentAccommodation.location;
      image = currentAccommodation.image;
    }
    else if (widget.category == BasePlaceCategory.restaurant) {
      Restaurant currentRestaurant = widget.place as Restaurant;
      title = currentRestaurant.title;
      info = currentRestaurant.info;
      location = currentRestaurant.location;
      image = currentRestaurant.image;
    }



    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: height * 30,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              info!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: AutoSizeText(
                "Konum",
                style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),

            AutoSizeText(
              location,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/place_details_bloc.dart';
import '../model/accommodation.dart';
import '../model/base_place.dart';
import '../model/enum/base_place_category.dart';
import '../model/place.dart';

class PlaceDetailsPage extends StatefulWidget {
  final BasePlace place;
  final BasePlaceCategory? category;

  const PlaceDetailsPage({Key? key, required this.place,this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late String title;
  late String? info;
  late String location;
  late String image;

  // sayfanın başlangıç durumu için initState
  @override
  void initState() {
    super.initState();
    if (widget.category == BasePlaceCategory.place) {
      Place currentPlace = widget.place as Place;
      title = currentPlace.title;
      info = currentPlace.info;
      location = currentPlace.location;
      image = currentPlace.image;
    } else {
      Accommodation currentAccommodation = widget.place as Accommodation;
      title = currentAccommodation.title;
      info = currentAccommodation.info;
      location = currentAccommodation.location;
      image = currentAccommodation.image;
    }
  }

  //sayfanın içeriği
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;

    //BlocProvider ile PlaceDetailsPageBloc'u sayfa içinde kullanılabilir hale getirdik
    return BlocProvider(
      create: (context) => PlaceDetailsPageBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        //BlocBuilder widget'ı ile Bloc'tan gelen durumları dinleyerek UI'yı güncelledik.
        body: BlocBuilder<PlaceDetailsPageBloc, PlaceDetailsPageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      height: height * 30,
                      width: width * 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  AutoSizeText(
                    info!,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                    maxLines: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: AutoSizeText(
                      "Konum",
                      style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AutoSizeText(
                    location,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

