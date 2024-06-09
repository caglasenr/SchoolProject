/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestRoutePage extends StatefulWidget {
  const BestRoutePage({super.key});

  @override
  State<StatefulWidget> createState() => _BestRoutePageState();
}

class _BestRoutePageState extends State<BestRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "En Uygun Rota",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Text(
          'Size En Uygun Rotamız Şu Sekilde...',
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}*/
import 'package:edirne_gezgini_ui/bloc/best_route_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestRoutePage extends StatefulWidget {
  const BestRoutePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BestRoutePageState();
}

class _BestRoutePageState extends State<BestRoutePage> {
  // Bloc'u oluşturuyoruz
  final BestRoutePageBloc _bloc = BestRoutePageBloc();

  @override
  void dispose() {
    // Bellek sızıntısını önlemek için Bloc'u kapatıyoruz
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: const Text(
          "En Uygun Rota",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<String>(
        // Bloc'tan gelen verileri dinliyoruz
        stream: _bloc.routeStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Eğer veri varsa, rotayı gösteriyoruz
            return Center(
              child: Text(
                'Size En Uygun Rotamız Şu Şekilde: ${snapshot.data}',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          } else {
            // Veri yoksa, bir yükleme gösterebiliriz veya başka bir işlem yapabiliriz
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
