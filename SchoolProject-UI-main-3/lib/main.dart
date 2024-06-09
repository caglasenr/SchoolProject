import 'package:edirne_gezgini_ui/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


/*void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProductLocalization(child: const BottomNavBar()));
}
*/
void main() {
  runApp(const BottomNavBar());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Edirne Gezgini",
      home:BottomNavBar(),

    );
  }
}


/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: BottomNavBar()),
    );
  }
}*/

