import 'dart:async';

class BestRoutePageBloc {
  // Bloc'un durumunu tutmak için StreamController kullanacağız
  final _routeStreamController = StreamController<String>();

  // Durumu dinlemek için bir Stream tanımlıyoruz
  Stream<String> get routeStream => _routeStreamController.stream;

  // Durumu güncellemek için bir fonksiyon
  void updateRoute(String route) {
    _routeStreamController.sink.add(route);
  }

  // Bellek sızıntısını önlemek için StreamController'ı kapatma
  void dispose() {
    _routeStreamController.close();
  }
}
