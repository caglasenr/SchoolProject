import 'package:edirne_gezgini_ui/bloc/place_answer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/accommodation_answer_bloc.dart';
import '../widget/user_questions.dart';
import 'best_route_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRoutePage extends StatefulWidget {
  const GetRoutePage({super.key});

  @override
  State<StatefulWidget> createState() => _GetRoutePageState();
}

class _GetRoutePageState extends State<GetRoutePage> {
  final AccommodationBloc _accommodationBloc = AccommodationBloc();
  final PlaceAnswerBloc _placeAnswerBloc = PlaceAnswerBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccommodationBloc>(
          create: (context) => _accommodationBloc,
        ),
        BlocProvider<PlaceAnswerBloc>(
          create: (context) => _placeAnswerBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "Rota Göster",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<AccommodationBloc, AccommodationState>(
          builder: (context, accommodationState) {
            return BlocBuilder<PlaceAnswerBloc, PlaceAnswerState>(
              builder: (context, placeAnswerState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Size en uygun rotayı vermemiz için lütfen soruları cevaplayın.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      QuestionsWidget(
                        question1: 'Edirne\'de konaklayacak mısınız?',
                        question2: 'Kültürel yerleri gezmeyi seviyor musunuz?',
                        answer1: accommodationState.answer,
                        answer2: placeAnswerState.answer,
                        onAnswer1Changed: (value) {
                          _accommodationBloc.add(AccommodationChanged(value));
                        },
                        onAnswer2Changed: (value) {
                          _placeAnswerBloc.add(PlaceAnswerChanged(value));
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BestRoutePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5.0,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'Rota Göster',
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _accommodationBloc.close();
    _placeAnswerBloc.close();
    super.dispose();
  }
}
